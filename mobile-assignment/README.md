# Qwic engineering flutter assignment

In this assignment, you are tasked to build a home screen that neatly displays the details of a bike with a gesture. You will have to retreive the bike details via an API listed below

## Flutter

You may use any flutter libraries to manage your state and to retreive the API. You may also use any code patterns to keep the app structured. Bonus points for keeping the app as simple as possible

## UI

You may use any of the included assets to create the home screen. You may also target a specific screen size such as an iphone X and Pixel 3. You may stick to just the landscape orientation.

Note: Since it's hard to figure out the exact margin values between ui elements from the included examples, we will leave it up to you to determine what looks best.

## Examples

<img src="https://github.com/qwicengineering/dev-assignment/blob/dbf2fde1a682aec7169e94b80d83188e54ed9a67/mobile-assignment/bike-details-animation.gif?raw=true" width="300" />

---

<img src="https://github.com/qwicengineering/dev-assignment/blob/main/mobile-assignment/bike-details-1.png?raw=true" width="300" />

---

<img src="https://github.com/qwicengineering/dev-assignment/blob/main/mobile-assignment/bike-details-2.png?raw=true" width="300" />

## Evaluation is based on

-   implementation of the home screen according to the video and attached images
-   implementation of the scroll animation displayed in the video example
-   implementation of the api to retreive bike details
-   must be able to target both android and iOS
-   some test coverage (at least three to four tests)

## API

```bash
curl -i -H "Accept: application/json" https://sp82l5ulp2.execute-api.eu-west-1.amazonaws.com/bikeDetails
```

## Response

```json
{
    "odo": 2001,
    "frameNumber": "EFY111222",
    "firmware": "1.2.1",
    "warranty": 1.5,
    "batteryCharge": 99.2,
    "batteryType": "BA184751",
    "batteryHealth": 99,
    "batteryFirmware": "2.08",
    "batteryWarranty": 1.5,
    "motorType": "Bafang M420",
    "motorSerialNumber": "BAFA8466578489",
    "motorFirmware": "2.034",
    "motorWarranty": 2
}
```

## Style guide (Optional)

-   you may follow our [qwic style guide](https://github.com/qwicengineering/styleguides)
