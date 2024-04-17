enum ScheduleType {
    case monday
    case tuesday
    case wednesday
    case thursday
    case friday
    case saturday
    case sunday
    
    static func stringFromScheduleType(_ type: ScheduleType) -> String {
            switch type {
            case .monday:
                return "Monday"
            case .tuesday:
                return "Tuesday"
            case .wednesday:
                return "Wednesday"
            case .thursday:
                return "Thursday"
            case .friday:
                return "Friday"
            case .saturday:
                return "Saturday"
            case .sunday:
                return "Sunday"
            }
        }
}

