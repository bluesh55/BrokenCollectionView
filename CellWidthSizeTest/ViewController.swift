//
//  ViewController.swift
//  CellWidthSizeTest
//
//  Created by 오승환 on 2018. 3. 4..
//  Copyright © 2018년 오승환. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    let RIGHT_SECTION_INSET: CGFloat = 20

    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        collectionView.delegate = self
        collectionView.dataSource = self
    }


}

extension ViewController: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {

    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: RIGHT_SECTION_INSET)
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 36
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CustomCollectionViewCell", for: indexPath) as! CustomCollectionViewCell

        return cell
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {

        if indexPath.row % 6 == 0 {
            return CGSize(width: 120, height: 42)
        } else {

            return CGSize(width: (collectionView.frame.size.width - 120 - RIGHT_SECTION_INSET) / 5, height: 42)
        }
    }
}

class CustomCollectionViewCell: UICollectionViewCell {


    override func awakeFromNib() {
        super.awakeFromNib()

        self.layer.borderColor = UIColor.black.cgColor
        self.layer.borderWidth = 1
    }
}
