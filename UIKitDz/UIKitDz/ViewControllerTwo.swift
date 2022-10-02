//
//  ViewControllerTwo.swift
//  UIKitDz
//
//  Created by Balik on 02.10.2022.
//

import UIKit

class ViewControllerTwo: UIViewController {
    
    @IBOutlet weak var ButtonSchet: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        ButtonSchet.layer.cornerRadius = 15
    }
    
    @IBAction func ButtonAction(_ sender: Any) {
        alertNext()
    }
    
    func nextButton() {
        if let vcThree = storyboard?.instantiateViewController(withIdentifier: "viewThree") as? ViewControllerThree {
            vcThree.modalPresentationStyle = .fullScreen
            present(vcThree, animated: true)
        }
    }
    
    func alertNext() {
        let alertNext = UIAlertController(title: "Выставить счет", message: "", preferredStyle: .alert)
        let actionNext = UIAlertAction(title: "Ok", style: .default) { actionNext in
            self.nextButton()
        }
        let actionBack = UIAlertAction(title: "Cancel", style: .cancel)
        
        alertNext.addAction(actionBack)
        alertNext.addAction(actionNext)
        self.present(alertNext, animated: true)
    }
    
}
