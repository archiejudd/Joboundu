//
//  ReviewViewController.swift
//  FoodPin
//
//  Created by Macbook on 27/04/2016.
//  Copyright © 2016 AppCoda. All rights reserved.
//

import UIKit



class ReviewViewController: UIViewController {

    
    @IBOutlet weak var backgroundImageView: UIImageView!
    @IBOutlet weak var ratingStackView: UIStackView!

    var rating:String?
    
    @IBAction func ratingSelected(sender: UIButton) {
        switch (sender.tag) {
            case 100: rating = "one"
            case 200: rating = "two"
            case 300: rating = "three"
            case 400: rating = "four"
            case 500: rating = "five"
            default: break
        }
        
        performSegueWithIdentifier("unwindToDetailView", sender: sender)
    
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let blurEffect = UIBlurEffect(style: UIBlurEffectStyle.Dark)
        let blurEffectView = UIVisualEffectView(effect: blurEffect)
        blurEffectView.frame = view.bounds
        backgroundImageView.addSubview(blurEffectView)
        
        ratingStackView.transform = CGAffineTransformMakeScale(0.0, 0.0)
        
    }
    
    override func viewDidAppear(animated: Bool) {
        
        UIView.animateWithDuration(0.4, delay: 0.0, options: [], animations: {
            self.ratingStackView.transform = CGAffineTransformIdentity
        }, completion: nil)
        
    }
    
    override func viewWillAppear(animated: Bool) {
        
        super.viewWillAppear(animated)
        
        navigationController?.setNavigationBarHidden(true, animated: true)
    
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
