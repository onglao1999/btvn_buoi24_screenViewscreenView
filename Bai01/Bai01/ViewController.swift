//
//  ViewController.swift
//  Bai01
//
//  Created by Ong_Lao_Ngao on 5/8/20.
//  Copyright © 2020 Ong_Lao_Ngao. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var scrollViewTop: UIScrollView!
    @IBOutlet weak var scrollViewBottom: UIScrollView!
    var views = [CustomView]()
    var image = [UIImage]()
    var labal = [String]()
    let screenWidth = UIScreen.main.bounds.width
    let screenHeight = UIScreen.main.bounds.height
    let range: CGFloat = 5
    override func viewDidLoad() {
        super.viewDidLoad()
        scrollViewTop.contentMode = .scaleAspectFit
        data()
        setupScrollWithImage(image)
        data2()
        setupScrolWithCustomView(views)
    }
    func data(){
        image = [
        UIImage(named: "lemon"),
        UIImage(named: "quacam"),
        UIImage(named: "quadauhau"),
        UIImage(named: "quadau"),
        UIImage(named: "quasaurieng"),
        UIImage(named: "qualuu"),
        
        
        ] as! [UIImage]
        labal = [
            "quachanh",
            "quacam",
            "quadauhau",
            "quadau",
            "quasaurieng",
            "qualuu"
        ]
    }

    func setupScrollWithImage(_ arrs: [UIImage]){
        scrollViewTop.backgroundColor = .white
        for (index, item) in arrs.enumerated() {
            let imageView = UIImageView(frame: CGRect(x: (screenWidth + range) * CGFloat(index), y: 0, width: screenHeight * 2/5, height: screenHeight * 2/5))
            imageView.image = item
            imageView.contentMode = .scaleToFill
            imageView.backgroundColor = .purple
            scrollViewTop.addSubview(imageView)
        }
        
        scrollViewTop.contentSize = CGSize(width: (screenWidth + range) * CGFloat(arrs.count), height: screenHeight * 2/5)
    }
    var dem = 0
    func data2(){
        
        for i in 0..<image.count {
            let data = Bundle.main.loadNibNamed("CustomView", owner: self, options: nil)?.first as! CustomView
            data.imageView.image = image[i]
            data.nameLabel.text = labal[i]
            views.append(data)
        }
       
    }
    
    func setupScrolWithCustomView(_ arr: [CustomView]){
        scrollViewBottom.backgroundColor = .purple
        for (index, item) in arr.enumerated() {
            item.frame = CGRect(x: 0, y: (screenHeight * 3/5 + range) * CGFloat(index), width: screenWidth, height: screenHeight * 3/5 )
            scrollViewBottom.addSubview(item)
        }
        
       
        scrollViewBottom.contentSize = CGSize(width: screenWidth - CGFloat(100), height: (screenHeight * 3/5 + range) * CGFloat(arr.count))
    }
    
    
}

