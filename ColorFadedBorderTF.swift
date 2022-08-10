/*
TextFeild with thin background border that fades from blue to grey 

* How to call

  TextField("Name", text: $name)
                .textFieldStyle(
                    ColorFadedBorder(
                        systemImageString: "person"
                    )
                )
*/


import SwiftUI

struct ColorFadedBorder: TextFieldStyle {
    
    let systemImageString: String
    
    // Hidden function to conform to this protocol
    func _body(configuration: TextField<Self._Label>) -> some View {
        ZStack {
            RoundedRectangle(cornerRadius: 5.0)
                .stroke(
                    LinearGradient(
                        colors: [
                            .blue,
                            .grey
                        ],
                        startPoint: .leading,
                        endPoint: .trailing
                    )
                )
                .frame(height: 40)
            
            HStack {
                Image(systemName: systemImageString)
                // Reference the TextField here
                configuration
            }
            .padding(.leading)
            .foregroundColor(.gray)
        }
    }
}
