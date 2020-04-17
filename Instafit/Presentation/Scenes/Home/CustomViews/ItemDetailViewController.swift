//
//  ItemDetailViewController.swift
//  Instafit
//
//  Created by Jordan Capa on 4/16/20.
//  Copyright © 2020 Jordan Capa. All rights reserved.
//

import UIKit

class ItemDetailViewController: UIViewController {
    
    var item: Item?
    private let imageView = UIImageView()
    private let descriptionLabel = UILabel(frame: .zero)

    override func viewDidLoad() {
        super.viewDidLoad()
        self.initView()
    }
    
    private func initView(){
        self.view.backgroundColor = .white
        guard let item = self.item else{
            return
        }
        self.title = item.name
        
        descriptionLabel.text = "Lorem Ipsum is simply dummy text of the printing and typesetting industry."
        descriptionLabel.textColor = .white
        descriptionLabel.frame = CGRect(x: 10, y: 0, width: self.view.frame.width, height: 200)
        descriptionLabel.numberOfLines = 0
        descriptionLabel.font = UIFont.systemFont(ofSize: 30, weight: .medium)
        
        view.addSubview(imageView)
        imageView.addSubview(descriptionLabel)
        
        
        imageView.frame = self.view.frame
        if let photoUrl = URL(string: item.cover){
            let placeholderImage = UIImage(named: "dwnlod-icon")!
            self.imageView.af.setImage(withURL: photoUrl, placeholderImage: placeholderImage)
        }
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
