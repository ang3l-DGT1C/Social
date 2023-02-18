//
//  ViewController.swift
//  Social
//
//  Created by Ángel González on 10/11/22.
//

import UIKit

class ViewController: UIViewController {
    var redes = ["twitter://user?screen_name=Fundacion_UNAM",
                  "fb://",
                  "vnd.youtube://user/FUNDUNAM",
                  "instagram://user?username=fundacionUNAM",
                  "tel:5553400900"]
    // Código UNICODE para convertir a iconos usando FontAwesome "\u{f099}"
    override func viewDidLoad() {
        super.viewDidLoad()
        let bgcolor = UIColor.blue
        let D = 80
        var Y = D
        let X:Int = Int(self.view.center.x - 30)
        let titulo=UILabel(frame: CGRect(x:0 , y:Y, width:Int(self.view.frame.width), height: 40))
        titulo.textAlignment = .center
        titulo.font = UIFont(name: "TamilSangamMN-Bold", size: 28)
        titulo.text = "Visita nuestras redes sociales"
        self.view.addSubview(titulo)
        Y += D
        
        let btn1 = UIButton(frame: CGRect(x:X , y:Y, width:D, height:D))
        btn1.titleLabel?.font = UIFont(name: "FontAwesome6Brands-Regular", size: 32)
        btn1.setTitle("twitter", for: .normal)
        btn1.backgroundColor = bgcolor
        btn1.tag = 0
        self.view.addSubview(btn1)
        Y += D + 20
        let btn2 = UIButton(frame: CGRect(x:X, y:Y, width: D, height: D))
        btn2.titleLabel?.font = UIFont(name: "FontAwesome6Brands-Regular", size: 32)
        btn2.setTitle("facebook", for: .normal)
        btn2.backgroundColor = bgcolor
        btn2.tag = 1
        self.view.addSubview(btn2)
        Y += D + 20
        let btn3 = UIButton(frame: CGRect(x:X, y:Y, width: D, height: D))
        btn3.titleLabel?.font = UIFont(name: "FontAwesome6Brands-Regular", size: 32)
        btn3.setTitle("youtube", for: .normal)
        btn3.backgroundColor = bgcolor
        btn3.tag = 2
        self.view.addSubview(btn3)
        Y += D + 20
        let btn4 = UIButton(frame: CGRect(x:X, y:Y, width: D, height: D))
        btn4.titleLabel?.font = UIFont(name: "FontAwesome6Brands-Regular", size: 32)
        btn4.setTitle("instagram", for: .normal)
        btn4.backgroundColor = bgcolor
        btn4.tag = 3
        self.view.addSubview(btn4)
        
        Y += D + 20
        let btn5 = UIButton(frame: CGRect(x:X, y:Y, width: D, height: D))
        btn5.titleLabel?.font = UIFont(name: "FontAwesome6Brands-Regular", size: 32)
        btn5.setTitle("phone", for: .normal)
        btn5.backgroundColor = bgcolor
        btn5.tag = 4
        self.view.addSubview(btn5)
        
        Y += D + 20
        let btn6 = UIButton(frame: CGRect(x:X, y:Y, width: D, height: D))
        btn6.titleLabel?.font = UIFont(name: "FontAwesome6Brands-Regular", size: 32)
        btn6.setImage(UIImage(systemName: "square.and.arrow.up.circle.fill"), for: .normal)
        btn6.backgroundColor = bgcolor
        btn6.tag = 5
        self.view.addSubview(btn6)
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.view.subviews.forEach { unView in
            if unView is UIButton {
                let tmpBtn = unView as! UIButton
                tmpBtn.addTarget(self, action:#selector(btnTouch(_ :)), for:.touchUpInside)
            }
        }
    }
    
    @objc func btnTouch(_ sender:UIButton) {
        if sender.tag == 5 {
            let contenido = ["Esta app es genial!"]
            let ac = UIActivityViewController(activityItems: contenido, applicationActivities:nil)
            self.present(ac, animated: true)
        }
        else {
            if let laURL = URL(string:redes[sender.tag]) {
                if UIApplication.shared.canOpenURL(laURL) {
                    UIApplication.shared.open(laURL, options: [:])
                }
            }
        }
    }
}

