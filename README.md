# viper-architecture
Use of VIPER architecture using protocols

![alt tag](https://github.com/PriyamDutta/viper-architecture/blob/master/Resources/viper.gif)

## View
Views are responsible for getting user actions to presenter & vice-versa.

## Interactor
Interactor, a vital component that contains all the business logics and data handling operations.

## Presenter
Presenter's plays intermmediate role of getting View's actions to Interactor, Interactor's response to View.
Also it takes part in routing actions to Router.

## Entity
Entity's are basic models which Interactor going to use.

## Router
Router's job is to hold the navigation logic.

--------------------------

```swift
protocol ViewToPresenterProtocol {
  var view: PresenterToViewProtocol? { get set }
  var interactor: PresenterToInteractorProtocol? { get set }
  var wireFrame: PresenterToRouterProtocol? { get set }
}
```

```swift
protocol PresenterToViewProtocol {
    var view: ViewToPresenterProtocol? { get set }
}
```

```swift
protocol PresenterToInteractorProtocol {
  var presenter: InteractorToPresenterProtocol? { get set }
  var networkManager: NetworkManagerProtocol? { get set }
  var localDataManager: LocalDataManagerProtocol? { get set }
}
```

```swift
protocol InteractorToPresenterProtocol {
  func onRecievedData()
}
```

```swift
protocol InteractorToRemoteDataManagerProtocol {
  func fetchDataFromServer()
}
```

```swift
protocol InteractorToLocalDataManagerProtocol {
  func fetchDataFromDatabase()
}
```

```swift
protocol PresenterToRouterProtocol {
  var localDataManager: RouterToPresenterProtocol? { get set }
  func showNextView()
}
```

```swift
protocol RouterToPresenterProtocol {
  func moduleDelegation()
}
```
## Module Delegation
Many times we have to communicate among other VIPER modules. For doing these communication module delegates were used.
Delegation happens in the Router to Router followed by Presenter.

