#  Dynamic cell 구현하기

- cell 의 메시지라벨의 오토레이아웃
- dynamic height 를 위해서 numberOfLines = 0
- dynamic width를 위해서 messageLabel.widthAnchor.constraint(lessThanOrEqualToConstant: 250)
- intrinsicContentSize 를 활용하여 컨텐츠에 따라 크기 다른 라벨 생성
- 메시지 그룹핑할 때 딕셔너리의 새로운 생성자를 사용해봄 
- Dictionary init<S>(grouping: S, by: (S.Element) -> Dictionary<Key, Value>.Key)
- Creates a new dictionary whose keys are the groupings returned by the given closure and whose values are arrays of the elements that returned each key.
