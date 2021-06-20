//
//  ViewController.swift
//  DemoCltnView
//
//  Created by Moin Shaikh on 20/06/21.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var cltnList: UICollectionView!
    @IBOutlet weak var cltnHeightConstraints: NSLayoutConstraint!
    
    private let spacing:CGFloat = 12.0
    private let aryCount:Int = 21
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.setupUI()
    }
    
    //MARK:- Setup UI
    func setupUI() {
        
        self.navigationController?.isNavigationBarHidden = true
        self.cltnList.register(UINib(nibName: "RelatedprodCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "RelatedprodCollectionViewCell")
        
        let cellSize = (cltnList.frame.size.width / 2) - 10
        let layout: UICollectionViewFlowLayout = (cltnList.collectionViewLayout as! UICollectionViewFlowLayout)
        layout.sectionInset = UIEdgeInsets(top: spacing, left: spacing, bottom: spacing, right: spacing)
        layout.minimumLineSpacing = spacing //Every cell bottom spacing
        layout.minimumInteritemSpacing = spacing
        layout.scrollDirection = .vertical
        layout.itemSize = CGSize(width: cellSize, height: cellSize) //same as sizeForItemAt
        
        cltnList.delegate = self
        cltnList.dataSource = self
        cltnList.showsHorizontalScrollIndicator = false
        cltnList.showsVerticalScrollIndicator = false
    }
    
    //MARK:- Collectionview height calculation
    func setupCltnHeight(cltnHeight:CGFloat) {
        if aryCount % 2 == 0 {
            cltnHeightConstraints.constant = (cltnHeight * (CGFloat(aryCount)/2)) + (CGFloat(aryCount)/2 * spacing) + spacing
        } else {
            cltnHeightConstraints.constant = (cltnHeight * (CGFloat(aryCount)/2)) + (CGFloat(aryCount)/2 * spacing) + spacing + cltnHeight / 2
        }
        // cltnHeightConstraints.constant = (cltnHeight * (CGFloat(aryCount)/2)) + 72 //)Cltnheight = Actual height * aryCount / 2) + (aryCount / 2*spacing) + spacing
    }
    
    //MARK:- BNutton Add To Cart
    @IBAction func btnAddToCart(_ sender: Any) {
        let nav = self.storyboard?.instantiateViewController(identifier: "idShoppingCartViewController")
        self.navigationController?.pushViewController(nav!, animated: true)
    }
}

//MARK:- Collection view flow layout
extension ViewController : UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let numberOfItemsPerRow:CGFloat = 2
        let spacingBetweenCells:CGFloat = self.spacing
        
        let totalSpacing = (2 * self.spacing) + ((numberOfItemsPerRow - 1) * spacingBetweenCells) //Amount of total spacing in a row
        
        if let collection = self.cltnList{
            let width = (collection.bounds.width - totalSpacing)/numberOfItemsPerRow
            
            //Cltn height setup (width + 20 = Both)
            setupCltnHeight(cltnHeight: width)
            return CGSize(width: width, height: width)
            
        }else{
            return CGSize(width: 0, height: 0)
        }
    }
}

//MARK:- Collection view datasource
extension ViewController : UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return aryCount
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "RelatedprodCollectionViewCell",for:indexPath) as! RelatedprodCollectionViewCell
        
        cell.lblVal.text = String(indexPath.row + 1)
        
        return cell
    }
}
