'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';
const RESOURCES = {
  "favicon.png": "5dcef449791fa27946b3d35ad8803796",
"manifest.json": "c73e9e7d4ed8d99b9452abd46bc4b18e",
"flutter.js": "f85e6fb278b0fd20c349186fb46ae36d",
"icons/Icon-maskable-192.png": "c457ef57daa1d16f64b27b786ec2ea3c",
"icons/Icon-maskable-512.png": "301a7604d45b3e739efc881eb04896ea",
"icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1",
"icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1",
"version.json": "a49bb9c5bdd0c2089932314b835fd72f",
"main.dart.js": "cffaad9363b000f7ecf8f881ccbeb27a",
"canvaskit/canvaskit.js": "2bc454a691c631b07a9307ac4ca47797",
"canvaskit/profiling/canvaskit.js": "38164e5a72bdad0faa4ce740c9b8e564",
"canvaskit/profiling/canvaskit.wasm": "95a45378b69e77af5ed2bc72b2209b94",
"canvaskit/canvaskit.wasm": "bf50631470eb967688cca13ee181af62",
"index.html": "5b42444626a431ee4dd432c8ada081a6",
"/": "5b42444626a431ee4dd432c8ada081a6",
"assets/AssetManifest.json": "040682d4af260f929274020606457c6a",
"assets/packages/fluttertoast/assets/toastify.css": "a85675050054f179444bc5ad70ffc635",
"assets/packages/fluttertoast/assets/toastify.js": "e7006a0a033d834ef9414d48db3be6fc",
"assets/packages/mixpanel_flutter/assets/mixpanel.js": "5c717055b6683529243c292ab78aa797",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "6d342eb68f170c97609e9da345464e5e",
"assets/packages/easy_localization/i18n/ar-DZ.json": "acc0a8eebb2fcee312764600f7cc41ec",
"assets/packages/easy_localization/i18n/ar.json": "acc0a8eebb2fcee312764600f7cc41ec",
"assets/packages/easy_localization/i18n/en.json": "5f5fda8715e8bf5116f77f469c5cf493",
"assets/packages/easy_localization/i18n/en-US.json": "5f5fda8715e8bf5116f77f469c5cf493",
"assets/fonts/MaterialIcons-Regular.otf": "95db9098c58fd6db106f1116bae85a0b",
"assets/shaders/ink_sparkle.frag": "ab4751ef630837e294889ca64470bb70",
"assets/NOTICES": "56302a5fd9ce57b98abd034f38ebaa77",
"assets/FontManifest.json": "34f873bacd1bf5d9d952569210e00a56",
"assets/assets/images/logo.svg": "75e884455e17008492b8d41b5230a1f3",
"assets/assets/images/Group%252018541.svg": "214bfe3263e8657cdd4408746fa4c2a1",
"assets/assets/images/dineInColored.svg": "b6b8e126392d0b72de33b206977670db",
"assets/assets/images/dineInsvg.svg": "0c8df3185ed1d84867a207f4ac29c656",
"assets/assets/images/qr.png": "be74e137bc6c82f63d29ebb351910d16",
"assets/assets/images/finger-scan.svg": "5ca75bacdb81d20f94b525238300d90b",
"assets/assets/images/takeAwayColored.svg": "69a32eb84a6c70c3d74e3d7b6fc947d9",
"assets/assets/images/loading.gif": "3f899a790ab677acd5762723b7743334",
"assets/assets/images/order_history.svg": "a0ef752ec6309d498acd2958f861b041",
"assets/assets/images/takeAway.svg": "b7560ab7233fd09e9ad2ffb166da8d8a",
"assets/assets/images/favorite.svg": "d4a96b4f43e5783a1a5a549ad751db37",
"assets/assets/images/mpesa.svg": "a669edfca2989e892f1a38179df6e474",
"assets/assets/images/loading.svg": "214bfe3263e8657cdd4408746fa4c2a1",
"assets/assets/images/launch_icon.png": "025bdf81f7bff10710b0d11aea5b063e",
"assets/assets/images/home.svg": "27dfd9cbbb94dcd62aa786ae0a603f2f",
"assets/assets/images/greentick.svg": "c259a6f318d70e10dc7d6125e734cf47",
"assets/assets/images/card-pos.svg": "f0f805c2a82135630ac5a212a67f125f",
"assets/assets/icons/notification_bell.svg": "dcc63b1c020deb23a2833b50ae68ec8e",
"assets/assets/icons/edit-2.svg": "9af6dc3aa8a15100607c9501e9205f8b",
"assets/assets/icons/reserve.svg": "12d861ad31512a12458ab9551d99a129",
"assets/assets/icons/notification.svg": "436249c39a5e240f98f1fe9b91a434c5",
"assets/assets/icons/fingerPrint.svg": "434c96e123d7a127c24524a32ba26ba4",
"assets/assets/icons/Group%252018602.png": "0c888a90e73236f0022a4b46804f2e3e",
"assets/assets/icons/close-circle.svg": "5f5c0a8c56877bf7461cbbe76dac1143",
"assets/assets/icons/finger_print_scan.svg": "05c06fea35175ac8fc47826effb55804",
"assets/assets/icons/split.svg": "eabfa089de838fd0c7f363c8abc21b37",
"assets/assets/icons/logout.png": "5bc9900967ee35e298c27927212bfe4c",
"assets/assets/icons/order_history.svg": "1de6bcc025b471e07889a5bf582c25e0",
"assets/assets/icons/cards.svg": "15aaf13dcc2a8b1b73b202ab46a29df0",
"assets/assets/icons/logo_icon.svg": "3accbbd2a3278d060b79c65993847a20",
"assets/assets/icons/face_id.svg": "b481f802e2c67454dcc0367596c8c1ca",
"assets/assets/icons/scan.svg": "35fe97b2190b410bd9443214d32edc48",
"assets/assets/icons/myorders.svg": "91c1a927faaaeed2185d699a6ec462ac",
"assets/assets/icons/tick-circle.svg": "6e0f66d9aa6864b8d0d4c2f152e67a9f",
"assets/assets/translations/en.json": "99914b932bd37a50b983c5e7c90ae93b",
"assets/assets/translations/en-US.json": "e1e74a288797530647a180103b6b5f68",
"assets/assets/translations/fr-FR.json": "e15c8365d6b81d34e04e0ecddf722ff1",
"assets/assets/fonts/mulish-medium.ttf": "4c3f41a7fb1e614785fa5edda23d7906",
"assets/assets/fonts/mulish-regular.ttf": "31423d3904a79ab8fccbad8c31f0c645",
"assets/assets/fonts/mulish-bold.ttf": "4df899b7abe1a8fc831ac4867d4e6a37"
};

// The application shell files that are downloaded before a service worker can
// start.
const CORE = [
  "main.dart.js",
"index.html",
"assets/AssetManifest.json",
"assets/FontManifest.json"];
// During install, the TEMP cache is populated with the application shell files.
self.addEventListener("install", (event) => {
  self.skipWaiting();
  return event.waitUntil(
    caches.open(TEMP).then((cache) => {
      return cache.addAll(
        CORE.map((value) => new Request(value, {'cache': 'reload'})));
    })
  );
});

// During activate, the cache is populated with the temp files downloaded in
// install. If this service worker is upgrading from one with a saved
// MANIFEST, then use this to retain unchanged resource files.
self.addEventListener("activate", function(event) {
  return event.waitUntil(async function() {
    try {
      var contentCache = await caches.open(CACHE_NAME);
      var tempCache = await caches.open(TEMP);
      var manifestCache = await caches.open(MANIFEST);
      var manifest = await manifestCache.match('manifest');
      // When there is no prior manifest, clear the entire cache.
      if (!manifest) {
        await caches.delete(CACHE_NAME);
        contentCache = await caches.open(CACHE_NAME);
        for (var request of await tempCache.keys()) {
          var response = await tempCache.match(request);
          await contentCache.put(request, response);
        }
        await caches.delete(TEMP);
        // Save the manifest to make future upgrades efficient.
        await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
        return;
      }
      var oldManifest = await manifest.json();
      var origin = self.location.origin;
      for (var request of await contentCache.keys()) {
        var key = request.url.substring(origin.length + 1);
        if (key == "") {
          key = "/";
        }
        // If a resource from the old manifest is not in the new cache, or if
        // the MD5 sum has changed, delete it. Otherwise the resource is left
        // in the cache and can be reused by the new service worker.
        if (!RESOURCES[key] || RESOURCES[key] != oldManifest[key]) {
          await contentCache.delete(request);
        }
      }
      // Populate the cache with the app shell TEMP files, potentially overwriting
      // cache files preserved above.
      for (var request of await tempCache.keys()) {
        var response = await tempCache.match(request);
        await contentCache.put(request, response);
      }
      await caches.delete(TEMP);
      // Save the manifest to make future upgrades efficient.
      await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
      return;
    } catch (err) {
      // On an unhandled exception the state of the cache cannot be guaranteed.
      console.error('Failed to upgrade service worker: ' + err);
      await caches.delete(CACHE_NAME);
      await caches.delete(TEMP);
      await caches.delete(MANIFEST);
    }
  }());
});

// The fetch handler redirects requests for RESOURCE files to the service
// worker cache.
self.addEventListener("fetch", (event) => {
  if (event.request.method !== 'GET') {
    return;
  }
  var origin = self.location.origin;
  var key = event.request.url.substring(origin.length + 1);
  // Redirect URLs to the index.html
  if (key.indexOf('?v=') != -1) {
    key = key.split('?v=')[0];
  }
  if (event.request.url == origin || event.request.url.startsWith(origin + '/#') || key == '') {
    key = '/';
  }
  // If the URL is not the RESOURCE list then return to signal that the
  // browser should take over.
  if (!RESOURCES[key]) {
    return;
  }
  // If the URL is the index.html, perform an online-first request.
  if (key == '/') {
    return onlineFirst(event);
  }
  event.respondWith(caches.open(CACHE_NAME)
    .then((cache) =>  {
      return cache.match(event.request).then((response) => {
        // Either respond with the cached resource, or perform a fetch and
        // lazily populate the cache only if the resource was successfully fetched.
        return response || fetch(event.request).then((response) => {
          if (response && Boolean(response.ok)) {
            cache.put(event.request, response.clone());
          }
          return response;
        });
      })
    })
  );
});

self.addEventListener('message', (event) => {
  // SkipWaiting can be used to immediately activate a waiting service worker.
  // This will also require a page refresh triggered by the main worker.
  if (event.data === 'skipWaiting') {
    self.skipWaiting();
    return;
  }
  if (event.data === 'downloadOffline') {
    downloadOffline();
    return;
  }
});

// Download offline will check the RESOURCES for all files not in the cache
// and populate them.
async function downloadOffline() {
  var resources = [];
  var contentCache = await caches.open(CACHE_NAME);
  var currentContent = {};
  for (var request of await contentCache.keys()) {
    var key = request.url.substring(origin.length + 1);
    if (key == "") {
      key = "/";
    }
    currentContent[key] = true;
  }
  for (var resourceKey of Object.keys(RESOURCES)) {
    if (!currentContent[resourceKey]) {
      resources.push(resourceKey);
    }
  }
  return contentCache.addAll(resources);
}

// Attempt to download the resource online before falling back to
// the offline cache.
function onlineFirst(event) {
  return event.respondWith(
    fetch(event.request).then((response) => {
      return caches.open(CACHE_NAME).then((cache) => {
        cache.put(event.request, response.clone());
        return response;
      });
    }).catch((error) => {
      return caches.open(CACHE_NAME).then((cache) => {
        return cache.match(event.request).then((response) => {
          if (response != null) {
            return response;
          }
          throw error;
        });
      });
    })
  );
}
