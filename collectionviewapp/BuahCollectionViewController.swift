//
//  BuahCollectionViewController.swift
//  collectionviewapp
//
//  Created by Fauzi Hawari on 20/08/18.
//  Copyright © 2018 Fauzi Hawari. All rights reserved.
//

import UIKit

private let reuseIdentifier = "Cell"

class BuahCollectionViewController: UICollectionViewController
{

    //deklarasi array
    var data = ["buah cherry","buah pir","buah apel hijau","buah apel merah","buah semangka"]
    var namagambar = [#imageLiteral(resourceName: "cery"),#imageLiteral(resourceName: "pir"),#imageLiteral(resourceName: "apelijo"),#imageLiteral(resourceName: "apel"),#imageLiteral(resourceName: "semangka")]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Mengatur jumlah kolom
        let layout = UICollectionViewFlowLayout()
        
        //ambil tinggi lebar dari device
        let lebar = UIScreen.main.bounds.width
        let tinggi = UIScreen.main.bounds.height
        
        //size item setting
        layout.itemSize = CGSize(width: lebar/2, height: tinggi/4)
        
        //spacing
        layout.minimumInteritemSpacing = 1
        layout.minimumLineSpacing = 0
        
        //layout include ke collection
        collectionView?.collectionViewLayout = layout
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */

    // MARK: UICollectionViewDataSource

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return data.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "idcolviw", for: indexPath) as? BuahCollectionViewCell
    
        //ambil dlabel dan image dari class cell
        cell?.lebel.text = data[indexPath.row]
        cell?.cellimage.image = namagambar[indexPath.row]
        
        // Configure the cell
    
        return cell!
    }
    
    override func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        //panggil story board
        let story = UIStoryboard(name: "Main", bundle: nil)
        
        //get id storyboard
        let hal2 = story.instantiateViewController(withIdentifier: "kedua")
        
        //action pindah menggunakan seque
        show(hal2, sender: self)
    }

    // MARK: UICollectionViewDelegate

    /*
    // Uncomment this method to specify if the specified item should be highlighted during tracking
    override func collectionView(_ collectionView: UICollectionView, shouldHighlightItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment this method to specify if the specified item should be selected
    override func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
    override func collectionView(_ collectionView: UICollectionView, shouldShowMenuForItemAt indexPath: IndexPath) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, canPerformAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, performAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) {
    
    }
    */

}
