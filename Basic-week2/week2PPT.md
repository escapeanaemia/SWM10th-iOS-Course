# 2주차 내용

# UITableView
- 반복되는 테이블(리스트)들을 보여주는 뷰
- UIViewController에 UITableView를 추가해서 사용하거나, UITableViewController를 상속받아서 사용할 수 있다.
- 주로 이벤트 처리와 데이터 관리는 `UITableViewDelegate`, `UITableViewDatasource`를 통해 이뤄진다.
# UITableViewController
- UIViewController의 자식 클래스로 UIViewController, UITableViewDelegate, UITableViewDatasource에 해당하는 역할을 모두 수행함

## Usage
```swift
//
//  TableViewController.swift
//  StackViewTest
//
//  Created by Andrew Han on 07/07/2019.
//  Copyright © 2019 Andrew Han. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 0
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 0
    }

    /*
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        // Configure the cell...

        return cell
    }
    */

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

```

- UIViewController와 다르게 UITableViewController에서 반드시 정의해줘야하는 **numberOfSection** , **numberOfRow** 메소드가 override 되어 있다. 테이블뷰에서 보여줄 섹션과 열의 갯수를 리턴한다.
- 그 이외에 주석처리 되어있는 메소드는 용도에 맞게 사용하면 된다.


# UITableViewCell
- UITableView에서 보여지는 각 요소들을 cell이라고 부름
- 이러한 cell들을 UITableViewCell이라고 부름
- UIView를 부모 클래스로 두고 있다.
- *실습 예정*

각 셀들에 해당하는 클래스를 만들어서 스토리보드 속 셀과 연결하면 셀의 여러 요소를 컨트롤 할 수 있다.

## Usage
```swift
import UIKit

class TableViewCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
```

- awakeFromNib : UIView에서 초기화시 실행되는 메소드이다. UITableViewCell에서 사용될 경우 해당 셀이 초기화 될 때 이뤄질 내용을 작성해주면 된다. (마치 뷰컨트롤러의 viewDidload와 유사한 기능을 한다.)

# NavigationViewController
- 앱에서 각 뷰 전환시 stack을 활용하여 뷰간 이동을 용이하게 해주는 컨트롤러
- A뷰 -\> B뷰로 전환시  A뷰에서 B뷰를 push하여 B뷰를 보여준다.
- B뷰를 종료하면 뷰를 pop하여 사라지게 한다. B뷰가 pop되면 이전에 로드되었던 A뷰가 나타난다.
- 여러뷰를 동시에 pop할 수 있다.
- 네비게이션 컨트롤러를 사용하면서 navigation bar을 사용할 수 있다. Navigation bar은 뷰간 네비게이션 이동을 돕는다.
- 가장 처음 실행되는 뷰를 RootViewController라고 부른다. RootViewController는 pop할 수 없다.

## Usage
```swift
class NavigationController: UINavigationController{ }
```

# Segue
- 두 개의 뷰속 전환을 정의하는 요소이다. Segue를 통해서 뷰간 이동을 정의하고 그에 따른 준비를 할 수 있다.
## 방법 1  - 스토리보드를 이용한 Segue
- 스토리보드에서 세그를 추가하고 싶은 두 뷰 사이를 마우스 드래그로 연결하는 방법.

## 방법 2 - 코드를 이용한 Segue
- 뷰를 전환하고 싶을 땐 아래의 present 메소드를 실행한다.
```swift
let storyboard = UIStoryboard(name: "스토리보드 이름", bundle: nil
let pushB = storyboard.instantiateViewController (withIdentifier: "viewControllerB") as! ViewControllerB
present(pushB, animated:true, completion:nil)
```
`animation : 뷰 로드시 애니메이션 효과를 넣을 것인가?`
`completion : 해당 구문 실행시 함께 실행될 핸들러 클로저를 넣어준다. `
- 뷰를 종료하고 싶을 땐 dismiss 메소드를 실행한다.
```swift
dismiss(animated: true)
```
*주의사항*
- navigation controller를 이용한 뷰 전환을 원할 경우 present 메소드가 아닌 push메소드를 이용해야 한다.
```swift
let storyboard = UIStoryboard(name: "스토리보드 이름", bundle: nil
let pushB = storyboard.instantiateViewController (withIdentifier: "viewControllerB") as! ViewControllerB
navigationController?.pushViewController(pushB, animated:true)
```
- 뷰를 종료하고 싶을 때 역시 dismiss가 아닌 pop 메소드를 이용한다.
```swift
self.navigationController.popViewController(animated: true)
```
- 옵셔널을 채크하기 위해 아래처럼 사용할 수 있다.
```swift
if let navigationIsIn = self.navigationController {
	navigationIsIn.popViewController(animated: true)
}else{
	dismiss(animated:true)
}
```

## Segue Prepare


# UIStackView
- 스택뷰는 주어진 조건에 따라 AutoLayout의 기능을 보다 쉽게 사용할 수 있게 해주는 강력한 친구이다. 조건들은 다음과 같다.
1. Axis : 스택뷰의 방향 - Vertical, Horizontal
2. Spacing : 인접뷰 간 공간
3. Distribution : X축 정렬
4. Alignment : Y축 정렬


# Singleton
- 하나의 공유된 클래스 인스턴스를 이용하여 shared instance에 접근하는 방식이다.
- 전역적으로 접근 가능하고 공유된 클래스 인스턴스를 제공하기위해 사용한다.
- 여러 스레드에서 동시에 접근해도 한번만 lazy하게 초기화되는 경우
```swift
class Singleton {
    static let sharedInstance = Singleton()
}
```
- 초기화 외에 다른 추가 설정을 수행해야하는 경우
```swift
class Singleton {
    static let sharedInstance: Singleton = {
        let instance = Singleton()
        // setup code
        return instance
    }()
}
```


# UIImagePickerController
- 앨범에서 내가 원하는 사진을 선택해서 등록할 때 사용한다. 동작시키는 순서는 다음과 같다.
1. isSourceTypeAvailable(\_:) class method를 호출하여 선택한 source type에서 이미지를 가져올 수 있음을 명시한다. SourceType에는 .camera, .photoLibrary, .savedPhotosAlbum이 있다.
2. availableMediaTypes(for:) class method를 호출하여 내가 사용하고 있는 source type에 가능한 media type이 어떤 것인지 확인해준다.
3. mediaTypes property를 setting해서 이미지, 영상, 혹은 둘 다 가능하게 할지를 image picker controller에 알려준다.
4. present(\_:animated:completion:) method를 호출하여 화면에 image picker를 띄운다. iPad에서는 source type에 따라 image picker가 띄워지는 방식이 다르고 .photoLibrary, .savedPhotosAlbum을 선택했을 경우엔 popover controller를 이용하여 picker를 띄워야한다.
5. 이미지를 선택하거나 cancel을 누르면 image picker가 사라진다.

## Declaration
```swift
class UIImagePickerController : UINavigationController
```


# NSDataAsset
- asset catalog에 있는 data set으로 초기화
- [Data Set Type](https://developer.apple.com/library/archive/documentation/Xcode/Reference/xcode_ref-Asset_Catalog_Format/DataSetType.html#//apple_ref/doc/uid/TP40015170-CH23) in [Asset Catalog Format Reference](https://developer.apple.com/library/archive/documentation/Xcode/Reference/xcode_ref-Asset_Catalog_Format/index.html#//apple_ref/doc/uid/TP40015170)

## Declaration
```swift
class NSDataAsset : NSObject
```


# UserDefaults
- 앱의 어느 곳에서나 데이터를 쉽게 읽고 저장할 수 있다.
- 사용자 기본 설정과 같은 단일 데이터 값에 적합하다. 대량의 유사한 데이터, 즉 테이블에 대한 레코드, 여러 사용자에 대한 데이터 등을 저장해야하는 경우에는 sqlite 데이터베이스가 더 적합하다.
- [데이터, 키(key)]으로 데이터를 저장한다. 키 값은 String이다.

## Usage
```swift
import UIKit

class ViewController: UITableViewController {
  @IBOutlet weak var TestSwitch: UISwitch!

  let myUserDefaults = UserDefaults.standard

  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
    TestSwitch.isOn = myUserDefaults.bool(forKey: "switchState")
  }

  @IBAction func switchAction(_ sender: Any) {
    myUserDefaults.set(TestSwitch.isOn, forKey: "switchState")
  }
}
```
