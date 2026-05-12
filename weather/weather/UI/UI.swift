import SwiftUI

struct DayWeather: Identifiable, Decodable {
    let id = UUID()
    let day: String
    let icon: String
    let temperature: Int8
}

struct UI: View {
    var location: String
    var currentTemperature: Int8
    var condition: String
    @Binding var isNight: Bool

    var data: [DayWeather] = [
        DayWeather(day: "TUE", icon: "sun.max.fill", temperature: 20),
        DayWeather(day: "WED", icon: "cloud.sun.fill", temperature: 18),
        DayWeather(day: "THU", icon: "cloud.sun.rain.fill", temperature: 16),
        DayWeather(day: "FRI", icon: "cloud.sun.rain.fill", temperature: 12),
        DayWeather(day: "SAT", icon: "cloud.sun.bolt.fill", temperature: 8),
        DayWeather(day: "SUN", icon: "cloud.snow.fill", temperature: -3)
    ]

    var body: some View {
        ScrollView {
            // current day
            VStack {
                Text(location)
                    .font(.system(.title))
                    .foregroundStyle(Color.white)
                    .fontWeight(.semibold)
                    .padding()
                VStack(spacing: 10) {
                    Image(systemName: isNight ? "moon.stars.fill" : "sun.max.fill")
                        .renderingMode(.original)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 180, height: 180)
                    Text("\(currentTemperature)°")
                        .font(.system(size: 72))
                        .foregroundStyle(Color.white)
                        .fontWeight(.bold)
                    
                }
            }.padding(.bottom, 60)

            // week list
            HStack(spacing: 18) {
                ForEach(data) { item in
                    DayInfoView(
                        dayOfWeek: item.day,
                        imageName: item.icon,
                        temperature: item.temperature
                    )
                }
            }
            .padding(.bottom, 40)
            
            // cta
            Button {
                isNight.toggle()
            } label: {
                Text("Change day time")
                    .frame(width: 280, height: 50)
                    .background(.white)
                    .font(.system(size: 20, weight: .bold))
                    .cornerRadius(10)
            }
        }
    }
}
