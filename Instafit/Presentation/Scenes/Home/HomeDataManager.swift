//
//  HomeDataManager.swift
//  Instafit
//
//  Created by Jordan Capa on 4/14/20.
//  Copyright © 2020 Jordan Capa. All rights reserved.
//

import UIKit
import CoreData

class HomeDataManager: HomeDataManagerProtocol {
    
    internal var interactor: HomeInteractorProtocol!
    
    private let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    private let appDelegate = (UIApplication.shared.delegate as! AppDelegate)
    private let background = DispatchQueue.global()
    
    
    private let apiClient: APIClient!
    
    init(apiClient: APIClient) {
        self.apiClient = apiClient
    }
    
    func getItems(_ completion: @escaping ((Result<ItemsResponse>) -> Void)) {
        let resource = Resource(url: URL(string: "https://dev.instafit.com/api/g1.0/user/home/workouts/news")!)
        
        apiClient.load(resource) { (result) in
            switch result {
            case .success(let data):
                do {
                    let items = try JSONDecoder().decode(ItemsResponse.self, from: data)
                    completion(.success(items))
                } catch {
                    completion(.failure(error))
                }
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    
    //MARK:- ItemEntity
    
    func getItems(items:[Item]){
        
        let localItems = self.getLocalItems()
        
        //Sync local items
        if localItems.count > 0{
            
            for item in items{
                if localItems.filter({$0.id == item.id}).isEmpty{
                    self.saveItem(item: item)
                }
            }
        }
        //firs time - save local items
        else{
            for item in items{
                self.saveItem(item: item)
            }
        }
        
        self.interactor?.showItems(items: getLocalItems())
    }
    
    func getLocalItems() -> [Item]{
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "ItemEntity")
        request.returnsObjectsAsFaults = false
        do {
            let result = try context.fetch(request)
            return result.map{ ($0 as! ItemEntity).getItem()}
        } catch {
            return []
        }
    }

    private func saveItem(item:Item){
        let itemEntity = ItemEntity(context: context)
        itemEntity.mapper(item: item)
        appDelegate.saveContext()
    }

    
}
