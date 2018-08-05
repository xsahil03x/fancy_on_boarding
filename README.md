# 👏 FancyOnBoarding

[![Say Thanks!](https://img.shields.io/badge/Say%20Thanks-!-1EAEDB.svg)](https://saythanks.io/to/xsahil03x) [![Twitter](https://img.shields.io/twitter/url/https/github.com/xsahil03x/fancy_on_boarding.svg?style=social)](https://twitter.com/intent/tweet?text=Wow:&url=https%3A%2F%2Fgithub.com%2Fxsahil03x%2Ffancy_on_boarding)

A Fancy OnBoarding Screen Library for Easy and Quick Usage.
* Checkout the Original Author : [![GitHub followers](https://img.shields.io/github/stars/matthew-carroll/flutter_ui_challenge_material_page_reveal.svg?style=social&label=Follow)](https://github.com/matthew-carroll/flutter_ui_challenge_material_page_reveal)
* Checkout the Original Designer : [![GitHub followers](https://img.shields.io/github/stars/Ramotion/paper-onboarding-android.svg?style=social&label=Follow)](https://github.com/Ramotion/paper-onboarding-android)

The source code is **100% Dart**, and everything resides in the [/lib](https://github.com/xsahil03x/fancy_on_boarding/tree/master/lib) folder.


### Show some :heart: and star the repo to support the project

[![GitHub stars](https://img.shields.io/github/stars/xsahil03x/fancy_on_boarding.svg?style=social&label=Star)](https://github.com/xsahil03x/fancy_on_boarding) [![GitHub forks](https://img.shields.io/github/forks/xsahil03x/fancy_on_boarding.svg?style=social&label=Fork)](https://github.com/xsahil03x/fancy_on_boarding/fork) [![GitHub watchers](https://img.shields.io/github/watchers/xsahil03x/fancy_on_boarding.svg?style=social&label=Watch)](https://github.com/xsahil03x/fancy_on_boarding) [![GitHub followers](https://img.shields.io/github/followers/xsahil03x.svg?style=social&label=Follow)](https://github.com/xsahil03x/fancy_on_boarding)  
[![Twitter Follow](https://img.shields.io/twitter/follow/xsahil03x.svg?style=social)](https://twitter.com/xsahil03x)

[![Open Source Love](https://badges.frapsoft.com/os/v1/open-source.svg?v=102)](https://opensource.org/licenses/MIT)
[![License](https://img.shields.io/badge/license-MIT-blue.svg)](https://github.com/xsahil03x/fancy_on_boarding/blob/master/LICENSE)


### GIF
<img src="https://user-images.githubusercontent.com/25670178/43687990-53a05526-98fe-11e8-90bd-0fe1a1d9a386.gif" height="400" alt="GIF"/>

## 💻 Installation
In the `dependencies:` section of your `pubspec.yaml`, add the following line:

```yaml
  fancy_on_boarding: <latest_version>
```

## ❔ Usage

### Create a List of PageModel

```
 final pageList = [
    PageModel(
        color: const Color(0xFF678FB4),
        heroAssetPath: 'assets/hotels.png',
        title: Text('Hotels',
            style: TextStyle(
              fontWeight: FontWeight.w800,
              color: Colors.white,
              fontSize: 34.0,
            )),
        body: Text('All hotels and hostels are sorted by hospitality rating',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white,
              fontSize: 18.0,
            )),
        iconAssetPath: 'assets/key.png'),
    PageModel(
        color: const Color(0xFF65B0B4),
        heroAssetPath: 'assets/banks.png',
        title: Text('Banks',
            style: TextStyle(
              fontWeight: FontWeight.w800,
              color: Colors.white,
              fontSize: 34.0,
            )),
        body: Text(
            'We carefully verify all banks before adding them into the app',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white,
              fontSize: 18.0,
            )),
        iconAssetPath: 'assets/wallet.png'),
    PageModel(
      color: const Color(0xFF9B90BC),
      heroAssetPath: 'assets/stores.png',
      title: Text('Store',
          style: TextStyle(
            fontWeight: FontWeight.w800,
            color: Colors.white,
            fontSize: 34.0,
          )),
      body: Text('All local stores are categorized for your convenience',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.white,
            fontSize: 18.0,
          )),
      iconAssetPath: 'assets/shopping_cart.png',
    ),
];
```

### Pass it into the FancyOnBoarding() method
```
@override
  Widget build(BuildContext context) {
    return Scaffold(body: FancyOnBoarding(pageList: pageList));
}
```

## 🎨 Customization and Attributes

All customizable attributes for ClapFab
<table>
    <th>Attribute Name</th>
    <th>Example Value</th>
    <th>Description</th>
    <tr>
        <td>color</td>
        <td>Color(0xFF65B0B4)</td>
        <td>The background color of the page</td>
    </tr>
    <tr>
        <td>heroAssetPath</td>
        <td>'assets/banks.png'</td>
        <td>The main onboarding image</td>
    </tr>
    <tr>
        <td>title</td>
        <td>Text('Banks')</td>
        <td>Title of the page</td>
    </tr>
    <tr>
        <td>body</td>
        <td>Text('We carefully verify all banks before adding them into the app')</td>
        <td>Body of the page</td>
    </tr>
    <tr>
        <td>iconAssetPath</td>
        <td>'assets/wallet.png'</td>
        <td>Icon for the floating bubble</td>
    </tr>
    
</table>


## 👨 Connect with me
<a href="https://twitter.com/xsahil03x"><img src="https://github.com/aritraroy/social-icons/blob/master/twitter-icon.png?raw=true" width="60"></a>
<a href="https://linkedin.com/in/xsahil03x"><img src="https://github.com/aritraroy/social-icons/blob/master/linkedin-icon.png?raw=true" width="60"></a>
<a href="https://facebook.com/xsahil03x"><img src="https://github.com/aritraroy/social-icons/blob/master/facebook-icon.png?raw=true" width="60"></a>
<a href="https://instagram.com/xsahil03x"><img src="https://github.com/aritraroy/social-icons/blob/master/instagram-icon.png?raw=true" width="60"></a>

# 👍 How to Contribute
1. Fork it
2. Create your feature branch (git checkout -b my-new-feature)
3. Commit your changes (git commit -am 'Add some feature')
4. Push to the branch (git push origin my-new-feature)
5. Create new Pull Request

# 📃 License

    Copyright (c) 2018 Sahil Kumar
    
    Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:
    
    The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.
    
    THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

## Getting Started

For help getting started with Flutter, view our online [documentation](https://flutter.io/).

For help on editing package code, view the [documentation](https://flutter.io/developing-packages/).
