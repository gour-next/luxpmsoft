//
//  BaseViewController.swift
//  alphametrica
//
//  Created by Gouranga Sasmal on 03/08/21.
//

import UIKit

class BaseViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    func setupLoaderAndAlert(_ viewModel: BaseViewModel) {
//
//        viewModel.errorMessageCompletion = { message in
//            DispatchQueue.main.async {
//                // show message in toast
//            }
//        }
        
        viewModel.alertCompletion = { (title, body) in
            DispatchQueue.main.async {
                self.presentAlert(with: title, description: body)
            }
        }
        
        viewModel.loaderCompletion = { shouldShow in
            DispatchQueue.main.async {
                if shouldShow {
                    // show loader
                    print("Loader on")
                } else {
                    // hide loader
                    print("Loader stop")
                }
            }
        }
    }
    
    func presentAlert(with title: String?, description: String?) {
        let alert = UIAlertController(title: title, message: description, preferredStyle: .alert)
        alert.addAction(UIAlertAction.init(title: "OK", style: .cancel, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    /// Get the ViewController from storyboard
    /// - Parameter storyboard: Storyboard name
    /// - Returns: ViewController
    ///
    ///       // Call this function like below
    ///       let vc: AMLoginViewController? = self.getViewController(from: StoryBoard.main)
    func getViewController<T: UIViewController>(from storyboard: StoryBoard) -> T? {
        let storyBoard = UIStoryboard(name: storyboard.rawValue, bundle: nil)
        let vc = storyBoard.instantiateViewController(withIdentifier: String(describing: T.self))
        return vc as? T
    }
    
    /// Get the ChildViewController of ParentViewController from storyboard
    /// - Parameters:
    ///   - storyboard: Storyboard name
    ///   - bClass: ParentViewController type
    /// - Returns: ChildViewController
    ///
    /// Lets say you have design a ParentViewController in Storyboard and assigned the storyboard id to 'ParentViewController'. Now, you have created a few ChildViewController by subclassing ParentViewController. Now, you wanted to push to those ChildViewController.
    ///
    ///       // Call this function like below
    ///       let vc: ChildViewController? = self.getViewController(from: StoryBoard.main, fromBaseClass: ParentViewController.self)
    func getViewController<T: UIViewController, U: UIViewController>(from storyboard: StoryBoard, fromBaseClass bClass: T.Type) -> U? {
        let storyBoard = UIStoryboard(name: storyboard.rawValue, bundle: nil)
        let vc = storyBoard.instantiateViewController(withIdentifier: String(describing: T.self))
        object_setClass(vc, U.self)
        return vc as? U
    }
    
    /// Get the ChildViewController of ParentViewController
    /// - Parameter bClass: Type of parent viewController
    /// - Returns: ChildViewController
    ///
    /// Lets say you have design a ParentViewController in xib. Now, you have created a few ChildViewController by subclassing ParentViewController. Now, you wanted to push to those ChildViewController.
    ///
    ///       // Call this function like below
    ///       let vc: ChildViewController? = self.getViewController(derivedFromBaseClass: ParentViewController.self)
    func getViewController<T: UIViewController, U: UIViewController>(derivedFromBaseClass bClass: T.Type) -> U {
        let vc = U.init(nibName: String(describing: T.self), bundle: nil)
        return vc
    }

}
