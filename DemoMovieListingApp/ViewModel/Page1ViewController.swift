//
//  Page1ViewController.swift
//  DemoMovieListingApp
//
//  Created by Julien on 23/09/21.
//

import UIKit

class Page1ViewController: UIViewController, UICollectionViewDelegate,UICollectionViewDataSource  {
   
    var movies:MovieData?
    
    

    @IBOutlet var MovieCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setNavBar()
        MovieCollectionView.delegate=self
        MovieCollectionView.dataSource=self
        MovieCollectionView.collectionViewLayout=UICollectionViewFlowLayout()
        
        MovieCollectionView.register(UINib(nibName: "MovieCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "reusablecell")
       
        
        //self.movies = self.getUsersList()
            
        
        self.movies=self.readLocalJSONFile(forName: "CONTENTLISTINGPAGE-PAGE1")
        self.MovieCollectionView.reloadData()
        
         
    }
    func setNavBar(){
        let backButton = UIBarButtonItem()
        backButton.title = " Romantic Comedy"
       backButton.tintColor=UIColor.white
        self.navigationController?.navigationBar.topItem?.backBarButtonItem = backButton
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return movies?.page.contentItems.content.count ?? 0
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell =  collectionView.dequeueReusableCell(withReuseIdentifier: "reusablecell", for: indexPath) as! MovieCollectionViewCell
        cell.movieLabel.text=movies!.page.contentItems.content[indexPath.row].name
        cell.movieImage.image=UIImage(named: "poster1")
            
        
        
        
        return cell
    }


    //MARK:- loading data from local json
    
//    func getUsersList() -> [MovieData]{
//        guard let path = Bundle.main.path(forResource: "CONTENTLISTINGPAGE-PAGE1", ofType: "json") else { return [] }
//        let url = URL(fileURLWithPath: path)
//
//        do{
//            let data = try Data(contentsOf: url)
//            //let json = try JSONSerialization.jsonObject(with: data, options: .mutableContainers)
//            let json=try JSONDecoder().decode(MovieData].self, from: data)
//
//            print(json)
//
//            guard let array = json as? [MovieData] else {return []}
//
//            for i in array{
//                print(i.page)
//            }
//            return array;
//
//        }catch{
//            print(error)
//            return []
//        }
//    }
//
    
    func readLocalJSONFile(forName name: String) -> MovieData?{
        do {
            if let filePath = Bundle.main.path(forResource: name, ofType: "json") {
                let fileUrl = URL(fileURLWithPath: filePath)
                let data = try Data(contentsOf: fileUrl)
                let decodedData = try JSONDecoder().decode(MovieData.self, from: data)
                print(decodedData)
                return decodedData
            }
        } catch {
            print("error: \(error)")
        }
        return nil
    }
    
}



extension Page1ViewController:UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
       let size=getItemSize(collectionView: collectionView, collectionViewLayout: collectionViewLayout)
        return CGSize(width: size, height: 250)
    }
    
}
func getItemSize(collectionView:UICollectionView, collectionViewLayout:UICollectionViewLayout) -> Int {
    let nbCol = 3
    let flowLayout = collectionViewLayout as! UICollectionViewFlowLayout
    let totalSpace = flowLayout.sectionInset.left
        + flowLayout.sectionInset.right
        + (flowLayout.minimumInteritemSpacing * CGFloat(nbCol - 1))
    let size = Int((collectionView.bounds.width - totalSpace) / CGFloat(nbCol))
    return size
}
