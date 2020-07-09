//
//  MeridianosViewController.swift
//  Ervas
//
//  Created by Fernando Augusto de Marins on 06/07/20.
//  Copyright © 2020 Fernando Augusto de Marins. All rights reserved.
//

import UIKit

// https://medium.com/@raj.amsarajm93/ios-swift-tutorial-imageview-zooming-and-horizontal-paging-dca0acb0165e

class MeridianosViewController: UIViewController {
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.hidesBarsOnTap = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.hidesBarsOnTap = false
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "MERIDIANOS"
    
        let viewHeight: CGFloat = view.bounds.size.height
        let viewWidth: CGFloat = view.bounds.size.width
        
        let scrollView = UIScrollView(frame: CGRect(x: 0, y: 0, width: viewWidth, height: viewHeight))
        scrollView.isPagingEnabled = true
        
        let images = ["meridiano2.jpg","meridiano3.jpg","meridiano4.jpg"]
        var xPostion: CGFloat = 0
        
        for image in images {
            let view = UIView(frame: CGRect(x: xPostion, y: 0, width: viewWidth, height: viewHeight))
            xPostion += viewWidth
            let imageView = ImageViewZoom(frame: CGRect(x: 0, y: 0, width: view.frame.size.width, height: view.frame.size.height))
            
            imageView.setup()
            imageView.imageScrollViewDelegate = self
            imageView.imageContentMode = .aspectFit
            imageView.initialOffset = .center
            imageView.display(image: UIImage(named: image)!)
            
            view.addSubview(imageView)
            scrollView.addSubview(view)
        }
        scrollView.contentSize = CGSize(width: xPostion, height: viewHeight)
        view.addSubview(scrollView)
    }

}

extension MeridianosViewController: ImageViewZoomDelegate {
    func imageScrollViewDidChangeOrientation(imageViewZoom: ImageViewZoom) {
        print("Did change orientation")
    }
    
    func scrollViewDidEndZooming(_ scrollView: UIScrollView, with view: UIView?, atScale scale: CGFloat) {
        print("scrollViewDidEndZooming at scale \(scale)")
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        print("scrollViewDidScroll at offset \(scrollView.contentOffset)")
    }
}
