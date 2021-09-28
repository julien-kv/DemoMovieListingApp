//
//  Page1ViewController.swift
//  DemoMovieListingApp
//
//  Created by Julien on 23/09/21.
//

import UIKit

class Page1ViewController: UIViewController, UICollectionViewDelegate,UICollectionViewDataSource  {
    
    var moviesArray=[SingleMovieCell]()
    @IBOutlet var MovieCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setNavBar()
        MovieCollectionView.delegate=self
        MovieCollectionView.dataSource=self
        MovieCollectionView.collectionViewLayout=UICollectionViewFlowLayout()
        
        MovieCollectionView.register(UINib(nibName: "MovieCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "reusablecell")
        self.readLocalJSONFile(forName: "CONTENTLISTINGPAGE-PAGE1")
        
        MovieCollectionView.register(UINib(nibName: "ActivityViewCell", bundle: nil), forCellWithReuseIdentifier: "activitycell")
    }
    var currentPage:Int=1
    var totalPage:Int=3
    var pageNam:String="CONTENTLISTINGPAGE-PAGE"
    
    func setNavBar(){
        let backButton = UIBarButtonItem()
        backButton.title = " Romantic Comedy"
        self.navigationController?.navigationBar.topItem?.rightBarButtonItem=
        backButton.tintColor=UIColor.white
        self.navigationController?.navigationBar.topItem?.backBarButtonItem = backButton
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return moviesArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        
        if((indexPath.row==(moviesArray.count)-1) && currentPage<totalPage)
        {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "activitycell", for: indexPath)as!ActivityViewCell
            cell.uiActivityCell.startAnimating()
            return cell
        }
        else{
            let cell =  collectionView.dequeueReusableCell(withReuseIdentifier: "reusablecell", for: indexPath) as! MovieCollectionViewCell
            
            cell.movieLabel.text=moviesArray[indexPath.row].name
            
            if let myImage = UIImage(named: moviesArray[indexPath.row].img) {
              // use your image (myImage), it exists!
                cell.movieImage.image=myImage
            }
            else{
                cell.movieImage.image=UIImage(named: "placeholder_for_missing_posters")
            }
            
           
            return cell
        }
    }
    
    
    //MARK:- loading data from local json
    
    func readLocalJSONFile(forName name: String){
        do {
            if let filePath = Bundle.main.path(forResource: name, ofType: "json") {
                let fileUrl = URL(fileURLWithPath: filePath)
                let data = try Data(contentsOf: fileUrl)
                let decodedData = try JSONDecoder().decode(MovieData.self, from: data)
                //print(decodedData)
                //print(currentPage)
                self.moviesArray.append(contentsOf: decodedData.page.contentItems.content)
                MovieCollectionView.reloadData()
            
                
                
            }
        } catch {
            print("error: \(error)")
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        print(indexPath.row)
       
        if((indexPath.row==(moviesArray.count)-1) && currentPage<totalPage)
        {
            self.currentPage=currentPage+1
            DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                self.readLocalJSONFile(forName: self.pageNam+"\(self.currentPage)")
                print("current page:",self.currentPage)
            }
        }
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


