//
//  ContentView.swift
//  SwiftUI-Demo
//
//  Created by Jitendra Prajapati on 31/01/20.
//  Copyright © 2020 Jitendra Prajapati. All rights reserved.
//

import SwiftUI
import Alamofire

struct ContentView: View {
    
    
    // MARK: - Propertiers
    @State private var email = ""
    @State private var password = ""
    
    
    var body: some View
    {
        
        VStack(alignment: .center, spacing: 10.0)
        {
            Text("Enter Login Detail")
                .font(.headline)
                .fontWeight(.bold)
                .foregroundColor(Color.white)
            
            
            TextField("Email", text: self.$email)
                .padding()
                .background(/*@START_MENU_TOKEN@*/Color.gray/*@END_MENU_TOKEN@*/)
                .foregroundColor(Color.white)
                .cornerRadius(20.0)
            
            
            
            SecureField("Password", text: self.$password)
                .padding()
                .background(/*@START_MENU_TOKEN@*/Color.gray/*@END_MENU_TOKEN@*/)
                .cornerRadius(20.0)
            
            
            
            
            
            Button(action: {
                // What to perform
                // self.activateProximitySensor()
            })
            {
                Text("Login")
                    .font(.body)
                    .fontWeight(.bold)
                    .foregroundColor(Color.black) .multilineTextAlignment(.center)   // How the button looks like
            }
            .padding()
            .background(Color.green)
            .cornerRadius(20.0)
            
        }
        .padding(.horizontal)
            
        .accentColor(.green)
        
        
    }
    
    func activateProximitySensor() {
        let device = UIDevice.current
        device.isProximityMonitoringEnabled = true
        if device.isProximityMonitoringEnabled {
            NotificationCenter.default.addObserver(self, selector: Selector(("proximityChanged:")), name: NSNotification.Name(rawValue: "UIDeviceProximityStateDidChangeNotification"), object: device)
        }
    }
    
    func proximityChanged(notification: NSNotification) {
        if let device = notification.object as? UIDevice {
            print("\(device) detected!")
        }
    }
    
    
    func downloadPDF() -> Void {
        
        
        let url="http://www.africau.edu/images/default/sample.pdf"
        
        let destination = DownloadRequest.suggestedDownloadDestination(for: .documentDirectory)
        
        Alamofire.download(
            url,
            method: .get,
            encoding: JSONEncoding.default,
            headers: nil,
            to: destination).downloadProgress(closure: { (progress) in
                //progress closure
            }).response(completionHandler: { (DefaultDownloadResponse) in
                
                let response=DefaultDownloadResponse.response.debugDescription
                print("Response is " + (response ))
                //here you able to access the DefaultDownloadResponse
                //result closure
            })
    }
}

protocol DownloadCallBack
{
    
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
