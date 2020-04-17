//
//  HomeViewController.swift
//  Instafit
//
//  Created by Jordan Capa on 4/14/20.
//  Copyright © 2020 Jordan Capa. All rights reserved.
//

import UIKit
import AlamofireImage
import Reachability

class HomeViewController: UIViewController {
    
    var presenter: HomePresenterProtocol!
    
    let itemsCollectionView:UICollectionView = UICollectionView(frame: CGRect(x: 0, y: 0, width: 0, height: 0), collectionViewLayout: PinterestLayout())
    
    var items:[Item] = [Item](){
        didSet{
            DispatchQueue.main.async {
                self.itemsCollectionView.reloadData()
            }
            
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()        
        _ = HomeConfigurator.sharedInstance.configure(self)
        initView()
    
    }
    
    
    //MARK: - Own Methods
    
    private func initView(){
        
        itemsCollectionView.frame = self.view.frame
        
        presenter.getItems()
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(
            title: "logout",
            style: .plain,
            target: self,
            action: #selector(closeButtonPressed)
        )
        
        self.initCollectionView()
    }
    
    private func initCollectionView(){
        //        layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 80, right: 0)
        
//        let itemsCollectionView:UICollectionView = UICollectionView(frame: self.view.frame, collectionViewLayout: layout)
        
        if let layout = itemsCollectionView.collectionViewLayout as? PinterestLayout {
          layout.delegate = self
        }
        
        itemsCollectionView.dataSource = self
        itemsCollectionView.delegate = self
        itemsCollectionView.register(ItemCollectionViewCell.self, forCellWithReuseIdentifier: ItemCollectionViewCell.identifier)
        itemsCollectionView.backgroundColor = UIColor.white
        
        if let layout = itemsCollectionView.collectionViewLayout as? PinterestLayout {
          layout.delegate = self
        }
        
        itemsCollectionView.contentInset = UIEdgeInsets(top: 15, left: 5, bottom: 80, right: 5)
        
        self.view.addSubview(itemsCollectionView)
    }
    
    //MARK: - Actions
    
    @objc func closeButtonPressed(){
        Utils.showAlert(viewController: self, title: "Cerrar Sesión", message: "¿Estas seguro de cerrar sesión?", completion: {
            self.presenter.logout()
        })
    }

    
    @objc func dismissKeyboard(){
        view.endEditing(true)
    }
}

extension HomeViewController: HomeViewProtocol{

    
    func showItems(items: [Item]){
        self.items = items
    }
    
    func showError(message: String){
        Utils.showError(viewController: self, title: "Error", message: "Todos los campos son requeridos.")
    }
}

extension HomeViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
       return items.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell:ItemCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: ItemCollectionViewCell.identifier, for: indexPath) as! ItemCollectionViewCell
        
        cell.textLabel.text = items[indexPath.row].name
        cell.setImage(url: items[indexPath.row].cover)
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
      let itemSize = (collectionView.frame.width - (collectionView.contentInset.left + collectionView.contentInset.right + 10)) / 2
      return CGSize(width: itemSize, height: itemSize)
    }



}

extension HomeViewController: PinterestLayoutDelegate {
  func collectionView( _ collectionView: UICollectionView, heightForPhotoAtIndexPath indexPath:IndexPath) -> CGFloat {    
    return Utils.getRandomHeight()
  }
}


