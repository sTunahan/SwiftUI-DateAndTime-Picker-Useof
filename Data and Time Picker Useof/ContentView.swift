

import SwiftUI

struct ContentView: View {
    
    /// for for date and time
    @State private var time = Date()
    
    /// for date and time control
    @State private var historyShow = false
    @State private var hourShow = false
    /// to get textfield inputs
    @State private var history = ""
    @State private var hour = ""
    
    
    var body: some View {
        VStack{
            
            TextField("History",text: $history)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
                .onTapGesture { /// to add onApGesture Click feature
                
                    self.historyShow = true
            }
            
            if historyShow {
                //Makes the Calendar or Time appear on the Screen
                      
                DatePicker("",selection:$time, displayedComponents:.date).labelsHidden()
                
                
                HStack{
                    Button(action:{
                        
                        // date is converted to desired format
                        let timeFormatter = DateFormatter()
                        timeFormatter.dateFormat = "MM/dd/yyyy"
                        let historyReceived = timeFormatter.string(from: self.time)
                        self.history = historyReceived
                        
                        
                        self.historyShow = false
                    }){
                        Text("Select History")
                    }
                    Button(action:{
                      
                        self.historyShow = false
                    }){
                        Text("Close").foregroundColor(Color .red)
                    }
                }
            }
            
            
            // For Time
            TextField("Hour",text: $hour)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
                .onTapGesture {
                    self.hourShow = true
            }
            
            if hourShow {
               
                DatePicker("",selection:$time, displayedComponents:.hourAndMinute).labelsHidden()
                
                
                HStack{
                    Button(action:{
                        
                       
                        let timeFormatter = DateFormatter()
                        timeFormatter.dateFormat = "hh:mm"
                        let hourReceived = timeFormatter.string(from: self.time)
                        self.hour = hourReceived
                        
                        self.hourShow = false
                    }){
                        Text("Select Hour")
                    }
                    Button(action:{
                        
                        self.hourShow = false
                    }){
                        Text("Close").foregroundColor(Color .red)
                    }
                }
            }
        }
      
    }

}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .previewDevice("iPhone 11")
    }
}
