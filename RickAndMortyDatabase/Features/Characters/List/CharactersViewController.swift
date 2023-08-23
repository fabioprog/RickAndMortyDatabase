//
//  CharactersViewController.swift
//  RickMortyDatabase
//
//  Created by Fabio Augusto Resende on 10/08/23.
//

import UIKit

class CharactersViewController: BaseViewController<CharactersView> {
    
    var viewModel: CharactersViewModelDelegate
    
    required init(viewModel: CharactersViewModelDelegate) {
        self.viewModel = viewModel
        super.init()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = viewModel.title
        customView.collectionView.dataSource = self
        customView.collectionView.delegate = self
        observeStates()
        viewModel.fetchCharacters(name: nil, status: nil)
        
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        customView.collectionView.collectionViewLayout.invalidateLayout()
    }
    
    private func observeStates() {
        viewModel.observeStates { [weak self] state in
            DispatchQueue.main.async {
                switch state {
                case .failure(let title, let error):
                    self?.customView.hideLoadingView()
                    self?.presentAlert(title: title,
                                       message: error, style: .alert,
                                       options: [(title: BaseStrings.ok.text, style: .default, uiIdentifier: "Ok")])
                case .reloadData:
                    self?.customView.hideLoadingView()
                    self?.customView.collectionView.reloadData()
                    self?.customView.collectionView.setContentOffset(.zero, animated: false)
                case .insertRows(let indexPaths):
                    self?.customView.collectionView.performBatchUpdates {
                        self?.customView.collectionView.insertItems(at: indexPaths)
                        self?.viewModel.isLoadingMoreCharacters = false
                    }
                    self?.customView.collectionView.scrollToItem(at: indexPaths[0], at: .bottom, animated: true)
                case .loading:
                    self?.customView.showLoadingView()
                default: break
                }
            }
        }
    }
    
    @objc func openFilter() {
        viewModel.navigator.navigateToFilter(delegate: self)
    }
}

extension CharactersViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.characters.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CharactersCollectionViewCell.identifier, for: indexPath) as? CharactersCollectionViewCell
        else { return UICollectionViewCell() }
        cell.setupData(character: viewModel.characters[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        guard let footerView = collectionView.dequeueReusableSupplementaryView(
            ofKind: kind,
            withReuseIdentifier: LoadingMoreFooterView.identifier,
            for: indexPath) as? LoadingMoreFooterView,
              kind == UICollectionView.elementKindSectionFooter
        else { return UICollectionReusableView() }
        return footerView
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForFooterInSection section: Int) -> CGSize {
        guard viewModel.hasMorePages else { return .zero }
        return CGSize(width: collectionView.frame.width,
                      height: 60)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let orientation = view.window?.windowScene?.interfaceOrientation
        
        if orientation == .landscapeLeft || orientation == .landscapeRight {
            let height = collectionView.bounds.height-30
            return CGSize(
                width: height / 1.6,
                height: height
            )
        } else {
            let width = (collectionView.bounds.width-30)/2
            return CGSize(
                width: width,
                height: width * 1.5
            )
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionView.deselectItem(at: indexPath, animated: true)
        let character = viewModel.characters[indexPath.row]
        viewModel.navigator.navigateToCharacterDetail(character: character)
    }
}

extension CharactersViewController: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        guard viewModel.hasMorePages, !viewModel.isLoadingMoreCharacters else { return }
        Timer.scheduledTimer(withTimeInterval: 0.2, repeats: false) { [weak self] t in
            let offset = scrollView.contentOffset.y
            let totalContentHeight = scrollView.contentSize.height
            let totalScrollViewFixedHeight = scrollView.frame.size.height
            
            if offset >= (totalContentHeight - totalScrollViewFixedHeight - 120) {
                self?.viewModel.fetchMoreCharacters()
            }
            t.invalidate()
        }
    }
}

extension CharactersViewController: CharacterFilterDelegate {
    func filterDidSet(name: String?, status: String?) {
        viewModel.nextUrl = nil
        viewModel.fetchCharacters(name: name, status: status)
    }
}
