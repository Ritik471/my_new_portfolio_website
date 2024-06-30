'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';

const RESOURCES = {"assets/AssetManifest.bin": "4c73bafcd55170d7073139054b879f87",
"assets/AssetManifest.bin.json": "2d4bbf044d989b6bed1be5cac0c080ce",
"assets/AssetManifest.json": "fe3aa3944d3dad83252be80ae4a6834d",
"assets/assets/animations/coder.json": "c9e548d376c50bee05c10f30d210c14f",
"assets/assets/animations/skills.json": "838dee70f11609332e3cb33b2b51e272",
"assets/assets/animations/working.json": "99d61cd95a8eda6c1ecd71262bc45a37",
"assets/assets/animations/yoga.json": "820fe3f1820431901ca5a62d9c276e00",
"assets/assets/email.png": "5eb3c4b86aafbee72b8c471b29413a50",
"assets/assets/linkedin2.png": "4ce916ab70e4bd1f4ced3c4e67a0e9fa",
"assets/assets/map.png": "9cc090022ae31337336d2024160714b8",
"assets/assets/phone.png": "45903a1ffa9ede882171aca9f71c4c29",
"assets/assets/photo.jpg": "a662475c1111ebeb8fabd09788656070",
"assets/assets/sidelogo.jpg": "227587c673672603f214f688c61b538b",
"assets/assets/Slide1.PNG": "2d73c66d54aadb79d9d44d501db8feae",
"assets/assets/Slide2.PNG": "e18913a23fc3cc140e595e7cf4a428fe",
"assets/assets/Slide3.PNG": "f80dc253038f155028431ee135429155",
"assets/assets/Slide4.PNG": "19eb8b409816a3ddc214225fefd506af",
"assets/assets%255Canimations%255Ccoder.json": "c9e548d376c50bee05c10f30d210c14f",
"assets/assets%255Canimations%255Cskills.json": "838dee70f11609332e3cb33b2b51e272",
"assets/assets%255Canimations%255Cworking.json": "99d61cd95a8eda6c1ecd71262bc45a37",
"assets/assets%255Canimations%255Cyoga.json": "820fe3f1820431901ca5a62d9c276e00",
"assets/assets%255Cemail.png": "5eb3c4b86aafbee72b8c471b29413a50",
"assets/assets%255Clinkedin2.png": "4ce916ab70e4bd1f4ced3c4e67a0e9fa",
"assets/assets%255Cmap.png": "9cc090022ae31337336d2024160714b8",
"assets/assets%255Cphone.png": "45903a1ffa9ede882171aca9f71c4c29",
"assets/assets%255Cphoto.jpg": "a662475c1111ebeb8fabd09788656070",
"assets/assets%255Csidelogo.jpg": "227587c673672603f214f688c61b538b",
"assets/assets%255CSlide1.PNG": "2d73c66d54aadb79d9d44d501db8feae",
"assets/assets%255CSlide2.PNG": "e18913a23fc3cc140e595e7cf4a428fe",
"assets/assets%255CSlide3.PNG": "f80dc253038f155028431ee135429155",
"assets/assets%255CSlide4.PNG": "19eb8b409816a3ddc214225fefd506af",
"assets/FontManifest.json": "5a32d4310a6f5d9a6b651e75ba0d7372",
"assets/fonts/MaterialIcons-Regular.otf": "0db35ae7a415370b89e807027510caf0",
"assets/NOTICES": "6b97965842bc0a6fb0279ddfbcab4f46",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "e986ebe42ef785b27164c36a9abc7818",
"assets/packages/font_awesome_flutter/lib/fonts/fa-brands-400.ttf": "b392c64816c3c79d6e4b75fcf7396761",
"assets/packages/font_awesome_flutter/lib/fonts/fa-regular-400.ttf": "f3307f62ddff94d2cd8b103daf8d1b0f",
"assets/packages/font_awesome_flutter/lib/fonts/fa-solid-900.ttf": "04f83c01dded195a11d21c2edf643455",
"assets/shaders/ink_sparkle.frag": "ecc85a2e95f5e9f53123dcaf8cb9b6ce",
"canvaskit/canvaskit.js": "c86fbd9e7b17accae76e5ad116583dc4",
"canvaskit/canvaskit.js.symbols": "38cba9233b92472a36ff011dc21c2c9f",
"canvaskit/canvaskit.wasm": "3d2a2d663e8c5111ac61a46367f751ac",
"canvaskit/chromium/canvaskit.js": "43787ac5098c648979c27c13c6f804c3",
"canvaskit/chromium/canvaskit.js.symbols": "4525682ef039faeb11f24f37436dca06",
"canvaskit/chromium/canvaskit.wasm": "f5934e694f12929ed56a671617acd254",
"canvaskit/skwasm.js": "445e9e400085faead4493be2224d95aa",
"canvaskit/skwasm.js.symbols": "741d50ffba71f89345996b0aa8426af8",
"canvaskit/skwasm.wasm": "e42815763c5d05bba43f9d0337fa7d84",
"canvaskit/skwasm.worker.js": "bfb704a6c714a75da9ef320991e88b03",
"favicon.png": "5dcef449791fa27946b3d35ad8803796",
"flutter.js": "c71a09214cb6f5f8996a531350400a9a",
"icons/android-chrome-192x192.png": "44bfd685e609191d902fca40b6eaf907",
"icons/android-chrome-512x512.png": "f982a6dade55012ea77b05378eefcf44",
"icons/apple-touch-icon.png": "5cfb0c06971d2532e40471857ad45550",
"index.html": "313176c8c1388639a2bac2fb7d88eaa2",
"/": "313176c8c1388639a2bac2fb7d88eaa2",
"logo.png": "f982a6dade55012ea77b05378eefcf44",
"main.dart.js": "bcee4e98ce19d22f9b5f64fd69b7550e",
"manifest.json": "d28b65484c70c3a4f007638d31f31442",
"version.json": "a0c9c2a9c268893204098e443fb01dcc"};
// The application shell files that are downloaded before a service worker can
// start.
const CORE = ["main.dart.js",
"index.html",
"assets/AssetManifest.bin.json",
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
        // Claim client to enable caching on first launch
        self.clients.claim();
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
      // Claim client to enable caching on first launch
      self.clients.claim();
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
