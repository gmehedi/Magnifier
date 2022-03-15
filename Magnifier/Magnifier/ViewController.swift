//
//  ViewController.swift
//  Magnifier
//
//  Created by Mehedi Hasan on 15/3/22.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var glassView: MagnifyingGlassView!
    @IBOutlet weak var mView: UIView!
    let magnifyingGlass = MagnifyingGlassView(offset: CGPoint(x: 50.0, y: -50.0), radius: 50.0, scale: 2.5)
        
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.magnifyingGlass.magnifyingGlassViewDelegate = self
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
            let location = touches.first!.location(in: view)
            
            magnifyingGlass.magnifiedView = view
            magnifyingGlass.magnify(at: location)
        }

        override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
            let location = touches.first!.location(in: view)

            magnifyingGlass.magnify(at: location)
        }
        
        override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
            magnifyingGlass.magnifiedView = nil
        }
        
        override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
            magnifyingGlass.magnifiedView = nil
        }



}

extension ViewController: MagnifyingGlassViewDelegate {
    
    func addAsSubView(sub: UIView) {
        self.mView.addSubview(sub)
    }

}
