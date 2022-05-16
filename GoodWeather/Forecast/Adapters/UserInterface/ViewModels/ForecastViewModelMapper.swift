import Foundation

final class ForecastViewModelMapper {
    
    private let dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "E"
        return formatter
    }()
    
    func toViewModel(dayForecast: DayForecast) -> DayForecastViewModel {
        let date = dateFormatter.string(from: dayForecast.date)
        let temperature = "\(Int(dayForecast.temperature))°"
        let pressure = "\(Int(dayForecast.pressure))hPa"
        let description = dayForecast.description
        return DayForecastViewModel(date: date, temperature: temperature, pressure: pressure, icon: dayForecast.icon, description: description)
    }
    
}
