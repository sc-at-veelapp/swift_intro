import SwiftUI

struct DayInfoView: View {
    var dayOfWeek: String
    var imageName: String
    var temperature: Int8

    var body: some View {
        VStack {
            Text(dayOfWeek)
                .foregroundStyle(Color.white)
                .font(.system(size: 16, weight: .medium))
            Image(systemName: imageName)
                .renderingMode(.original)
                .aspectRatio(contentMode: .fit)
                .frame(width: 40, height: 40)

            Text("\(temperature)°")
                .font(.system(size: 28, weight: .medium))
                .foregroundStyle(Color.white)
        }
    }
}
