# upMob
<p align="center">

![GitHub Workflow Status](https://img.shields.io/github/workflow/status/jayantkatia/upMob/Flutter%20CI?style=for-the-badge)
![GitHub repo size](https://img.shields.io/github/repo-size/jayantkatia/upMob?style=for-the-badge)
![GitHub](https://img.shields.io/github/license/jayantkatia/upMob?style=for-the-badge)
![GitHub release (latest SemVer)](https://img.shields.io/github/v/release/jayantkatia/upMob?style=for-the-badge)
</p>

<p align="center">UpMob uses <a href="https://github.com/jayantkatia/upMob-api">UpMob API</a> to get the mobiles devices information which are yet to come to Indian markets<p>



## :rocket: Getting Started
1. <a href="https://flutter.dev/docs/get-started/install">**Install the Flutter SDK & Android Studio**</a>
2. Navigate into the project directory.
3. Define the environment variables in ```.env``` file at root of the project.
   ```.env
    HOST=yourhost.com
    PORT=8080
    PATH=/some-path
    ```

    You might like [rest-client](https://marketplace.visualstudio.com/items?itemName=humao.rest-client), if you use [VS Code](https://code.visualstudio.com/). This extension  allows you to send HTTP request and view the response in VS Code directly. Rest-client API requests are already defined in the ```api_requests/``` directory. You need to define the environment vairables though. In the ```.vscode/settings.json```,
    ```
    {
        "rest-client.environmentVariables": {
            "$shared": {
                "HOST": "yourhost.com",
                "PORT": "8080",
                "PATH": "/some-path"
            }
        }
    }
    ```
4. Run 
    ```shell
    flutter run 
    ```
4. Open the code and start editing.

## :hammer: Uses UpMob API 
UpMob depends on [UpMob API v1.x](https://github.com/jayantkatia/upMob-api/releases)

## :pencil2: TODO 
- [x] Bookmark devices
- [ ] Toggle between Themes
- [ ] Locate Nearby Stores using Google Maps API 

## :memo: License
Licensed under the [MIT License](https://github.com/jayantkatia/upMob/LICENSE). 

## :sparkles: Development and Contributing
Yes, please! Feel free to contribute, raise issues and recommend best practices.

A few resources to get you started:
- [Flutter Documentation](https://flutter.dev/docs)
- [Cookbook: Useful Flutter samples](https://flutter.dev/docs/cookbook)
