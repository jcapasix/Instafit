//
//  CollectionAnimator.swift
//  Instafit
//
//  Created by Jordan Capa on 4/16/20.
//  Copyright © 2020 Jordan Capa. All rights reserved.
//

import UIKit

typealias CollectionAnimation = (UICollectionViewCell, IndexPath, UICollectionView) -> Void

enum CollectionAnimationFactory{
    
    static func makeFade(duration: TimeInterval, delayFactor: Double) -> CollectionAnimation {
        return { cell, indexPath, _ in
            cell.alpha = 0
            //cell.transform =  CGAffineTransform(scaleX: 0.8, y: 0.8)
            
            UIView.animate(
                withDuration: duration,
                delay: delayFactor * Double(indexPath.row),
                animations: {
                    cell.alpha = 1
                    //cell.transform =  CGAffineTransform(scaleX: 1.0, y: 1.0)
            })
        }
    }
    
    static func makeMoveUpWithBounce(rowHeight: CGFloat, duration: TimeInterval, delayFactor: Double) -> CollectionAnimation {
        return { cell, indexPath, tableView in
            cell.transform = CGAffineTransform(translationX: 0, y: rowHeight)
            
            UIView.animate(
                withDuration: duration,
                delay: delayFactor * Double(indexPath.row),
                usingSpringWithDamping: 0.4,
                initialSpringVelocity: 0.1,
                options: [.curveEaseInOut],
                animations: {
                    cell.transform = CGAffineTransform(translationX: 0, y: 0)
            })
        }
    }
    
    static func makeSlideIn(duration: TimeInterval, delayFactor: Double) -> CollectionAnimation {
        return { cell, indexPath, tableView in
            cell.transform = CGAffineTransform(translationX: tableView.bounds.width, y: 0)
            cell.alpha = 0
            UIView.animate(
                withDuration: duration,
                delay: delayFactor * Double(indexPath.row),
                options: [.curveEaseInOut],
                animations: {
                    cell.alpha = 1
                    cell.transform = CGAffineTransform(translationX: 0, y: 0)
            })
        }
    }
    
    static func makeMoveUpWithFade(rowHeight: CGFloat, duration: TimeInterval, delayFactor: Double) -> CollectionAnimation {
        return { cell, indexPath, tableView in
            cell.transform = CGAffineTransform(translationX: 0, y: rowHeight / 2)
            cell.alpha = 0
            
            UIView.animate(
                withDuration: duration,
                delay: delayFactor * Double(indexPath.row),
                options: [.curveEaseInOut],
                animations: {
                    cell.transform = CGAffineTransform(translationX: 0, y: 0)
                    cell.alpha = 1
            })
        }
    }
}



final class CollectionAnimator {
    
    private var hasAnimatedAllCells = false
    private let animation: CollectionAnimation
    
    init(animation: @escaping CollectionAnimation) {
        self.animation = animation
    }
    
    func collectionAnimate(cell: UICollectionViewCell, at indexPath: IndexPath, in tableView: UICollectionView) {
        guard !hasAnimatedAllCells else {
            return
        }
        animation(cell, indexPath, tableView)
        hasAnimatedAllCells = tableView.isLastVisibleCell(at: indexPath)
    }
}

