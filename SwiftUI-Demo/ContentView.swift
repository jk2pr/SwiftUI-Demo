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
    var body: some View {
        
       Button(action: {
            // What to perform
        self.downloadPDF()
        })
       {
         Text("Download pdf")   // How the button looks like
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
                print("Response is " + (response as! String))
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
