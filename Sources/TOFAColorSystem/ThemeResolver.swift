import Foundation

public enum TOFAThemeResolver {
    public static func month(for date: Date, calendar: Calendar = .current) -> TOFAMonth {
        TOFAMonth.from(date: date, calendar: calendar)
    }

    public static func phase(now: Date, sunrise: Date, sunset: Date) -> TOFAPhase {
        if now >= sunrise && now < sunset {
            return .day
        } else {
            return .night
        }
    }

    public static func phase(now: Date, fallbackDayStartHour: Int = 7, fallbackNightStartHour: Int = 18, calendar: Calendar = .current) -> TOFAPhase {
        let hour = calendar.component(.hour, from: now)
        return (hour >= fallbackDayStartHour && hour < fallbackNightStartHour) ? .day : .night
    }

    public static func bundle(
        for date: Date,
        phase: TOFAPhase,
        calendar: Calendar = .current
    ) -> TOFAThemeBundle {
        TOFAThemeLibrary.bundle(month: month(for: date, calendar: calendar), phase: phase)
    }

    public static func bundle(
        for date: Date,
        sunrise: Date,
        sunset: Date,
        calendar: Calendar = .current
    ) -> TOFAThemeBundle {
        let resolvedPhase = phase(now: date, sunrise: sunrise, sunset: sunset)
        return bundle(for: date, phase: resolvedPhase, calendar: calendar)
    }
}
