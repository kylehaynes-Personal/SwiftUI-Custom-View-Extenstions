import swiftUI

struct ClubGridView: View {
  @ObservedObject var clubData = ClubData()
  
  let spacing: GCFloat = 10
  
  var body: some View {
    
    let columns = [GridItem(.flexible(), spacing: spacing), GridItem(.flexible(), spacing: spacing)]
    
    ScrollView {
      LazyVGrid(columns: columns, spacing: spacing) {
        // navigation link to detials
          ForEach(self.clubData.bag) { club in
             ClubItemView(club: club)
          }
      }
      .padding(.horizontal)
      
    }
    .background(Color.white)
  }
  // toolbar item for AddButton() -> AddClubView()
}


struct ClubItemView: View {
 
  let club: Club
  
  var body: some View {
      GeometryReader { reader in
        
         VStack(spacing: .5) {
            ZStack {
              
              Circle()
                 .scale(0.7)
                 .background(Color.blue.opacity(0.7)
                             
              Circle()
                 .scale(0.6)
                 .background(Color.gray.opacity(0.9)
                             
              Text(club.symb)
                .resizable()
                .scaledToFit()
                .ForgroundColor(.blue)
                .frame(width: 50)
            }
            .offset(x: 0, y: -30)
                             
           Text(club.brand)
              .font(.system(size: 20, weight: .bold, design: .rounded))
         }
         .frame(width: reader.size.width, height: reader.size.height)
      }
      .frame(height: 150)
      .clipShape(RoundedRectangle(cornerRadius: 20))
      .shadow(color: Color.black.opacity(0.2), radius: 10, y: 5)
  }
  
}
