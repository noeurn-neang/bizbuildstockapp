import 'package:flutter/material.dart';
import 'package:flutter_core/getx.dart';

var cardTemplates = [
  {
    "id": 1,
    "name": "Portrait Template 1",
    "companyCode": "",
    "image": "assets/images/templates/template1-1-protrait.jpg",
    "width": 1024.0,
    "height": 1787.0,
    "detail": [
      {
        "key": "fullName",
        "position": {"x": 300.0, "y": 896.0},
        "width": 600.0,
        "height": 120.0,
        "fontColor": "#ffffff",
        "fontSize": 72.0
      },
      {
        "key": "phone",
        "position": {"x": 300.0, "y": 1140.0},
        "width": 600.0,
        "height": 120.0,
        "fontColor": "#ffffff",
        "fontSize": 72.0
      },
      {
        "key": "website",
        "position": {"x": 300.0, "y": 1370.0},
        "width": 600.0,
        "height": 120.0,
        "fontColor": "#ffffff",
        "fontSize": 72.0
      },
      {
        "key": "address",
        "position": {"x": 300.0, "y": 1600.0},
        "width": 600.0,
        "height": 120.0,
        "fontColor": "#ffffff",
        "fontSize": 72.0
      }
    ]
  },
  {
    "id": 2,
    "name": "Portrait Template 2",
    "companyCode": "",
    "image": "assets/images/templates/template1-2-protrait.jpg",
    "width": 1024.0,
    "height": 1787.0,
    "detail": [
      {
        "key": "fullName",
        "position": {"x": 300.0, "y": 896.0},
        "width": 600.0,
        "height": 120.0,
        "fontColor": "#ffffff",
        "fontSize": 72.0
      },
      {
        "key": "phone",
        "position": {"x": 300.0, "y": 1140.0},
        "width": 600.0,
        "height": 120.0,
        "fontColor": "#ffffff",
        "fontSize": 72.0
      },
      {
        "key": "website",
        "position": {"x": 300.0, "y": 1370.0},
        "width": 600.0,
        "height": 120.0,
        "fontColor": "#ffffff",
        "fontSize": 72.0
      },
      {
        "key": "address",
        "position": {"x": 300.0, "y": 1600.0},
        "width": 600.0,
        "height": 120.0,
        "fontColor": "#ffffff",
        "fontSize": 72.0
      }
    ]
  },
  {
    "id": 3,
    "name": "Portrait Template 3",
    "companyCode": "",
    "image": "assets/images/templates/template1-3-protrait.jpg",
    "width": 1024.0,
    "height": 1787.0,
    "detail": [
      {
        "key": "fullName",
        "position": {"x": 300.0, "y": 896.0},
        "width": 600.0,
        "height": 120.0,
        "fontColor": "#ffffff",
        "fontSize": 72.0
      },
      {
        "key": "phone",
        "position": {"x": 300.0, "y": 1140.0},
        "width": 600.0,
        "height": 120.0,
        "fontColor": "#ffffff",
        "fontSize": 72.0
      },
      {
        "key": "website",
        "position": {"x": 300.0, "y": 1370.0},
        "width": 600.0,
        "height": 120.0,
        "fontColor": "#ffffff",
        "fontSize": 72.0
      },
      {
        "key": "address",
        "position": {"x": 300.0, "y": 1600.0},
        "width": 600.0,
        "height": 120.0,
        "fontColor": "#ffffff",
        "fontSize": 72.0
      }
    ]
  },
  {
    "id": 4,
    "name": "Portrait Template 4",
    "companyCode": "",
    "image": "assets/images/templates/template2-1-protrait.jpg",
    "width": 1024.0,
    "height": 1787.0,
    "detail": [
      {
        "key": "fullName",
        "position": {"x": 300.0, "y": 896.0},
        "width": 600.0,
        "height": 120.0,
        "fontColor": "#ffffff",
        "fontSize": 72.0
      },
      {
        "key": "phone",
        "position": {"x": 300.0, "y": 1140.0},
        "width": 600.0,
        "height": 120.0,
        "fontColor": "#ffffff",
        "fontSize": 72.0
      },
      {
        "key": "website",
        "position": {"x": 300.0, "y": 1370.0},
        "width": 600.0,
        "height": 120.0,
        "fontColor": "#ffffff",
        "fontSize": 72.0
      },
      {
        "key": "address",
        "position": {"x": 300.0, "y": 1600.0},
        "width": 600.0,
        "height": 120.0,
        "fontColor": "#ffffff",
        "fontSize": 72.0
      }
    ]
  },
  {
    "id": 5,
    "name": "Portrait Template 5",
    "companyCode": "",
    "image": "assets/images/templates/template2-2-protrait.jpg",
    "width": 1024.0,
    "height": 1787.0,
    "detail": [
      {
        "key": "fullName",
        "position": {"x": 300.0, "y": 896.0},
        "width": 600.0,
        "height": 120.0,
        "fontColor": "#ffffff",
        "fontSize": 72.0
      },
      {
        "key": "phone",
        "position": {"x": 300.0, "y": 1140.0},
        "width": 600.0,
        "height": 120.0,
        "fontColor": "#ffffff",
        "fontSize": 72.0
      },
      {
        "key": "website",
        "position": {"x": 300.0, "y": 1370.0},
        "width": 600.0,
        "height": 120.0,
        "fontColor": "#ffffff",
        "fontSize": 72.0
      },
      {
        "key": "address",
        "position": {"x": 300.0, "y": 1600.0},
        "width": 600.0,
        "height": 120.0,
        "fontColor": "#ffffff",
        "fontSize": 72.0
      }
    ]
  },
  {
    "id": 6,
    "name": "Portrait Template 6",
    "companyCode": "",
    "image": "assets/images/templates/template2-3-protrait.jpg",
    "width": 1024.0,
    "height": 1787.0,
    "detail": [
      {
        "key": "fullName",
        "position": {"x": 300.0, "y": 896.0},
        "width": 600.0,
        "height": 120.0,
        "fontColor": "#ffffff",
        "fontSize": 72.0
      },
      {
        "key": "phone",
        "position": {"x": 300.0, "y": 1140.0},
        "width": 600.0,
        "height": 120.0,
        "fontColor": "#ffffff",
        "fontSize": 72.0
      },
      {
        "key": "website",
        "position": {"x": 300.0, "y": 1370.0},
        "width": 600.0,
        "height": 120.0,
        "fontColor": "#ffffff",
        "fontSize": 72.0
      },
      {
        "key": "address",
        "position": {"x": 300.0, "y": 1600.0},
        "width": 600.0,
        "height": 120.0,
        "fontColor": "#ffffff",
        "fontSize": 72.0
      }
    ]
  },
  {
    "id": 7,
    "name": "Portrait Template 7",
    "companyCode": "",
    "image": "assets/images/templates/template3-1-protrait.jpg",
    "width": 1024.0,
    "height": 1787.0,
    "detail": [
      {
        "key": "fullName",
        "position": {"x": 300.0, "y": 896.0},
        "width": 600.0,
        "height": 120.0,
        "fontColor": "#ffffff",
        "fontSize": 72.0
      },
      {
        "key": "phone",
        "position": {"x": 300.0, "y": 1140.0},
        "width": 600.0,
        "height": 120.0,
        "fontColor": "#ffffff",
        "fontSize": 72.0
      },
      {
        "key": "website",
        "position": {"x": 300.0, "y": 1370.0},
        "width": 600.0,
        "height": 120.0,
        "fontColor": "#ffffff",
        "fontSize": 72.0
      },
      {
        "key": "address",
        "position": {"x": 300.0, "y": 1600.0},
        "width": 600.0,
        "height": 120.0,
        "fontColor": "#ffffff",
        "fontSize": 72.0
      }
    ]
  },
  {
    "id": 8,
    "name": "Portrait Template 8",
    "companyCode": "",
    "image": "assets/images/templates/template3-2-protrait.jpg",
    "width": 1024.0,
    "height": 1787.0,
    "detail": [
      {
        "key": "fullName",
        "position": {"x": 300.0, "y": 896.0},
        "width": 600.0,
        "height": 120.0,
        "fontColor": "#ffffff",
        "fontSize": 72.0
      },
      {
        "key": "phone",
        "position": {"x": 300.0, "y": 1140.0},
        "width": 600.0,
        "height": 120.0,
        "fontColor": "#ffffff",
        "fontSize": 72.0
      },
      {
        "key": "website",
        "position": {"x": 300.0, "y": 1370.0},
        "width": 600.0,
        "height": 120.0,
        "fontColor": "#ffffff",
        "fontSize": 72.0
      },
      {
        "key": "address",
        "position": {"x": 300.0, "y": 1600.0},
        "width": 600.0,
        "height": 120.0,
        "fontColor": "#ffffff",
        "fontSize": 72.0
      }
    ]
  },
  {
    "id": 9,
    "name": "Portrait Template 9",
    "companyCode": "",
    "image": "assets/images/templates/template2-3-protrait.jpg",
    "width": 1024.0,
    "height": 1787.0,
    "detail": [
      {
        "key": "fullName",
        "position": {"x": 300.0, "y": 896.0},
        "width": 600.0,
        "height": 120.0,
        "fontColor": "#ffffff",
        "fontSize": 72.0
      },
      {
        "key": "phone",
        "position": {"x": 300.0, "y": 1140.0},
        "width": 600.0,
        "height": 120.0,
        "fontColor": "#ffffff",
        "fontSize": 72.0
      },
      {
        "key": "website",
        "position": {"x": 300.0, "y": 1370.0},
        "width": 600.0,
        "height": 120.0,
        "fontColor": "#ffffff",
        "fontSize": 72.0
      },
      {
        "key": "address",
        "position": {"x": 300.0, "y": 1600.0},
        "width": 600.0,
        "height": 120.0,
        "fontColor": "#ffffff",
        "fontSize": 72.0
      }
    ]
  },
  {
    "id": 10,
    "name": "Landscape Template 1",
    "companyCode": "",
    "image": "assets/images/templates/template1-1-landscape.jpg",
    "width": 1225.0,
    "height": 675.0,
    "detail": [
      {
        "key": "fullName",
        "position": {"x": 116.0, "y": 130.0},
        "width": 500.0,
        "height": 68.0,
        "fontColor": "#000000",
        "fontSize": 40.0,
        "fontWeight": FontWeight.bold
      },
      {
        "key": "position",
        "position": {"x": 116.0, "y": 190.0},
        "width": 500.0,
        "height": 58.0,
        "fontColor": "#000000",
        "fontSize": 30.0
      },
      {
        "key": "phone",
        "position": {"x": 180.0, "y": 291.0},
        "width": 430.0,
        "height": 58.0,
        "fontColor": "#000000",
        "fontSize": 30.0
      },
      {
        "key": "email",
        "position": {"x": 180.0, "y": 371.0},
        "width": 430.0,
        "height": 58.0,
        "fontColor": "#000000",
        "fontSize": 30.0
      },
      {
        "key": "website",
        "position": {"x": 180.0, "y": 441.0},
        "width": 430.0,
        "height": 58.0,
        "fontColor": "#000000",
        "fontSize": 30.0
      },
      {
        "key": "address",
        "position": {"x": 180.0, "y": 521.0},
        "width": 430.0,
        "height": 100.0,
        "fontColor": "#000000",
        "fontSize": 30.0
      },
    ]
  },
];

getTemplateById(int? id) {
  return cardTemplates.firstWhereOrNull((element) => element['id'] == id);
}
