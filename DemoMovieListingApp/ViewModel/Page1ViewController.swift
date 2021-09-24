//
//  Page1ViewController.swift
//  DemoMovieListingApp
//
//  Created by Julien on 23/09/21.
//

import UIKit

class Page1ViewController: UIViewController  {
   
    var movies=[MovieData]()
    
    

    @IBOutlet var MovieCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setNavBar()
        self.movies = self.getUsersList()
            self.MovieCollectionView.reloadData()
        
        
       
        
        
       // MovieCollectionView.delegate=self
        //MovieCollectionView.dataSource=self
        MovieCollectionView.register(UINib(nibName: "MovieCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "moviecell")
        
    }
    func setNavBar(){
        let backButton = UIBarButtonItem()
        backButton.title = " Romantic Comedy"
       backButton.tintColor=UIColor.white
        self.navigationController?.navigationBar.topItem?.backBarButtonItem = backButton
    }
//    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        return movies.count
//    }
//
//    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//
//    }
//

    //MARK:- loading data from local json
    
    func getUsersList() -> [MovieData]{
        guard let path = Bundle.main.path(forResource: "CONTENTLISTINGPAGE-PAGE1", ofType: "json") else { return [] }
        let url = URL(fileURLWithPath: path)

        do{
            let data = try Data(contentsOf: url)
            let json = try JSONSerialization.jsonObject(with: data, options: .mutableContainers)
            

            guard let array = json as? [MovieData] else {return []}
            

            return array;

        }catch{
            print(error)
            return []
        }
    }
  
    
}

