//
//  BaseviewController.swift
//  Prueba Nextia Mitch
//
//  Created by Mitch Samaniego on 30/11/20.
//

import UIKit

class BaseViewController: UIViewController {
    
    var activityView = UIActivityIndicatorView(style: .whiteLarge)
    var isLoading = false
    let loadingContainer: UIView = UIView()

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    func showError( msg: String ) {
        let alert = UIAlertController(title: "Error", message: msg, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
        self.present(alert, animated: true)
    }
    

    func showActivityIndicator() {
        
        loadingContainer.frame =  self.view.frame
        loadingContainer.center =  self.view.center
        loadingContainer.backgroundColor = UIColor.init(red: 0.9255, green: 0.3137, blue: 0.3373, alpha: 1.0) /* #ec5056 */
        
        let loadingView: UIView = UIView()
        loadingView.frame = CGRect(x: 0, y: 0, width: 80, height: 80)
        loadingView.center = self.view.center
        loadingView.backgroundColor = UIColor.init(red: 0.9255, green: 0.3137, blue: 0.3373, alpha: 1.0) /* #ec5056 */
        loadingView.clipsToBounds = true
        loadingView.layer.cornerRadius = 10
        
        let actInd: UIActivityIndicatorView = UIActivityIndicatorView()
        actInd.frame = CGRect(x: 0.0, y: 0.0, width: 40.0, height: 40.0);
        actInd.style = UIActivityIndicatorView.Style.whiteLarge
        actInd.center = CGPoint(x: loadingView.frame.size.width / 2, y: loadingView.frame.size.height / 2)
        loadingView.addSubview(actInd)
        loadingContainer.addSubview(loadingView)
        self.view.addSubview(loadingContainer)
        actInd.startAnimating()
        isLoading.toggle()
    }
    
    func hideActivityIndicator(){
        if (isLoading){
            print("Ocultar el loader")
            activityView.stopAnimating()
            isLoading.toggle()
            loadingContainer.removeFromSuperview()
        }
    }

    
    
}

extension UIColor {
    public convenience init?(hex: String) {
        let r, g, b, a: CGFloat

        if hex.hasPrefix("#") {
            let start = hex.index(hex.startIndex, offsetBy: 1)
            let hexColor = String(hex[start...])

            if hexColor.count == 8 {
                let scanner = Scanner(string: hexColor)
                var hexNumber: UInt64 = 0

                if scanner.scanHexInt64(&hexNumber) {
                    r = CGFloat((hexNumber & 0xff000000) >> 24) / 255
                    g = CGFloat((hexNumber & 0x00ff0000) >> 16) / 255
                    b = CGFloat((hexNumber & 0x0000ff00) >> 8) / 255
                    a = CGFloat(hexNumber & 0x000000ff) / 255
                    print("el valor de a es: \(a)")
                    self.init(red: r, green: g, blue: b, alpha: a)
                    return
                }
            }
        }

        return nil
    }
}

