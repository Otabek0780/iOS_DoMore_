//
//  HomeViewController.swift
//  iOS_DoMore_
//
//  Created by Otabek Tuychiev on 02/02/2021.
//

import UIKit

class HomeViewController: UIViewController, UICollectionViewDelegate,UICollectionViewDataSource {
    
    @IBOutlet var collectionView: UICollectionView!
    
    let numOfColumns : CGFloat = 2
    var items: Array<Item> = Array()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        initViews()
        
    }
    
    // MARK: - Methods
    
    func initViews() {
        collectionView.dataSource = self
        collectionView.delegate = self
        
        addNavigationBar()
        
        self.collectionView.register(UINib(nibName: "ItemCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "myCell")
        
        if let flowLayout = collectionView?.collectionViewLayout as? UICollectionViewFlowLayout {
            let screenSize: CGRect = UIScreen.main.bounds
            let cellWidth =  screenSize.width / numOfColumns - 15
            flowLayout.itemSize = CGSize(width: cellWidth, height: cellWidth)
        }
        
        items.append(Item(title: "Jordan's Team", image: "post_img_1"))
        items.append(Item(title: "Somwhere in NewYork City", image: "post_Image_1"))
        items.append(Item(title: "Walking with Spike", image: "post_Image_2"))
        items.append(Item(title: "Jordan's Team", image: "post_img_1"))
        items.append(Item(title: "Somwhere in NewYork City", image: "post_Image_1"))
        items.append(Item(title: "Walking with Spike", image: "post_Image_2"))
        items.append(Item(title: "Somwhere in NewYork City", image: "post_Image_1"))
        items.append(Item(title: "Walking with Spike", image: "post_Image_2"))
    
          
    }
    // Bar Icons :)
    // ............................................Adding Bar ............................
    func addNavigationBar() {
        
        
        let scroll = UIImage(named: "ic_Scroll")
        
        //........Adding Bar Icons.......
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: scroll, style: .plain, target: self, action: #selector(rightTapped))
        title = "Messenger"
    }
    // ..........................................Calling View Controllers............................
    func callScrollViewController() {
        let vc = ScrollViewController(nibName: "ScrollViewController", bundle: nil)
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    // MARK: - Actions
    @objc func rightTapped() {
        callScrollViewController()
    }
    
    // MARK: - CollectionView
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return items.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let item = items[indexPath.row]
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "myCell", for: indexPath) as! ItemCollectionViewCell
        
        cell.post_Image.image = UIImage(named: item.image!)
        cell.comment_Label.text = item.title
        
        return cell
    }
    
}
