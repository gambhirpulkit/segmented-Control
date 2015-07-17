//  segmentedControl
//
//  Created by Dignitas Digital on 7/1/15.
//  Copyright (c) 2015 Dignitas Digital. All rights reserved.
//

import UIKit

class collectionVc: UICollectionViewController, UICollectionViewDelegateFlowLayout {


    @IBOutlet var collectView: UICollectionView!


 //   @IBOutlet weak var segmentControl: UISegmentedControl!
 //   @IBOutlet weak var segmentControl: UISegmentedControl!

    /*
    @IBAction func segmentAction(sender: UISegmentedControl) {
    
        
        // Segmented control code
       
        switch segmentControl.selectedSegmentIndex
        {
        case 0:
    
        case 1:
        
        default:
            break;
        }

    }

    */
    
    var links : [MovieData]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
        links = [MovieData]()
       let api = APIControl()
        api.loadShots("https://gist.githubusercontent.com/gambhirpulkit/d6a1e46724572068eb46/raw/d7545462003e7c78ee3c1406d5e5427c3fc6bf44/demo-content", completion: didLoadShots)

    }
    
    func didLoadShots(links: [MovieData]) {
        self.links = links
        collectView.reloadData()
        // println(links.count)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    // Header Section
    
    override func collectionView(collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, atIndexPath indexPath: NSIndexPath) -> UICollectionReusableView
    {
        
        let header = collectionView.dequeueReusableSupplementaryViewOfKind(UICollectionElementKindSectionHeader, withReuseIdentifier: "headersection", forIndexPath: indexPath) as! headerVc
        
        
    //    header.textLabel.text = "Hii"
        
      
 /*
        
        func segmentAction(sender: UISegmentedControl) {
            

            
            // Segmented control code
            
            switch header.segmentControl.selectedSegmentIndex
            {
            case 0:
                println("hii")
            case 1:
                println("bye")
            default:
                break;
            }
            
        }
           //    header.segmentControl.addTarget(self, action: Selector("segmentAction:"), forControlEvents: UIControlEvents.ValueChanged)
    */    
        
        return header
    }

    
    
    override func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1
    }
    
    override func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return links.count
        
    }
    
    override func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        
        
        
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("Cell", forIndexPath: indexPath) as! UICollectionViewCell
        
        let linksCell = links[indexPath.row] as MovieData
        
        let random = links[indexPath.row].url! as String?
        
        //      var img =  UIImage(data: NSData(contentsOfURL: NSURL(string:"\(random)")!)!)
        var img: NSURL = NSURL(string: random!)!
        var test =  UIImage(data: NSData(contentsOfURL: img)!)
        println(test)
        // println(img!)
        if let linkLabel = cell.viewWithTag(1) as? UILabel {
            linkLabel.text = linksCell.movie
            println(linkLabel.text)
        }
        if let imgLabel = cell.viewWithTag(2) as? UIImageView
        {
            imgLabel.image = test
        }
        //  var imageLabel = UIImage(named: "\(random)")
        // println(imageLabel)
        //  imgLabel = UIImageView(image: test)
        // println(imgLabel)
        
        //       imgLabel.image = test
        //  self.view.addSubview(imgLabel)
        
        return cell
    }
    
}

