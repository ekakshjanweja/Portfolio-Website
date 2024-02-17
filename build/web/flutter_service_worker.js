'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';

const RESOURCES = {"assets/AssetManifest.bin": "b77ee77d982bda71e7101c5e1a145567",
"assets/AssetManifest.bin.json": "21ab694ec02664294709ce0da0a08001",
"assets/AssetManifest.json": "6e4b0b884ef881d4d67f47c82c16f31f",
"assets/assets/icon.png": "1e232ccb98f3878700fd46a566513513",
"assets/assets/icon_dark.svg": "97b263c29564f95b0463135621baf00e",
"assets/assets/icon_light.svg": "937628d7e449a379a8da4c7311ca24ad",
"assets/assets/logos/dart.svg": "65e48aa9b8889dd03d3305444db4a23d",
"assets/assets/logos/figma.svg": "a8c0451898ae74df119f6f0a7d08e7bd",
"assets/assets/logos/firebase.svg": "7d3b312aa0b66a77e5fca94a314336d1",
"assets/assets/logos/flutter.svg": "bd9fec894dfe707631e11a1dfedb25b5",
"assets/assets/logos/github_black.svg": "8d9280bbcc1e44c1cc9c9946a0ecb903",
"assets/assets/logos/github_white.svg": "6d6f4496221479705accfa3213598dee",
"assets/assets/logos/hashnode.svg": "6809ea914634c803abeee9f342711194",
"assets/assets/logos/insta.svg": "2413ceef2f7bf562aa0478f7f5dfe852",
"assets/assets/logos/linkedin.svg": "0219a7eb96118e2bb3a84363ab3c5398",
"assets/assets/logos/notion.svg": "374a83ff8136427d274ae4bc1903eb59",
"assets/assets/logos/notion_white.svg": "83c280118acb3c8025930b4e4008413b",
"assets/assets/logos/playstore.svg": "9c194cafb04003bbe938d071890b5445",
"assets/assets/logos/react.svg": "07c7685b7498e4f954101972fb33ebd2",
"assets/assets/logos/tailwind.svg": "cc158cf4095e982db9f0a790bfede80d",
"assets/assets/logos/tas.svg": "022bc2740fb16fe93c437a99fc98e47b",
"assets/assets/logos/tbb.svg": "dcf0df6c49cb263686d3aed5e11a6225",
"assets/assets/logos/tbb_logo.png": "24b2066ce4db3ec4b6284d57f43d2c62",
"assets/assets/logos/ts.svg": "38b5960710e6a63afe16ca2277f68e2d",
"assets/assets/logos/twitter.svg": "1f5b9151949c1befacaf3168ba05105a",
"assets/assets/logos/valorant.svg": "f05b9bc214d8da5821c9b8898a3fb802",
"assets/assets/logos/zu.svg": "8e34a57d9460c98d6efb943171269363",
"assets/assets/logos/zu_logo.png": "8e0948533cafb2c94fc6829499284643",
"assets/assets/logo_dark.svg": "62cea80a53102706c7297d5cac9d31a1",
"assets/assets/logo_light.svg": "8a4844894c1fb56bad200bd4c7a67d1b",
"assets/assets/profile.png": "9d53665337c13b9204affb2fc77d472b",
"assets/FontManifest.json": "5a32d4310a6f5d9a6b651e75ba0d7372",
"assets/fonts/MaterialIcons-Regular.otf": "5e70f60cae0a22250e717531411d92e6",
"assets/NOTICES": "9d9cae2f385667eccf954ebff4940f49",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "89ed8f4e49bcdfc0b5bfc9b24591e347",
"assets/packages/font_awesome_flutter/lib/fonts/fa-brands-400.ttf": "d7791ef376c159f302b8ad90a748d2ab",
"assets/packages/font_awesome_flutter/lib/fonts/fa-regular-400.ttf": "5070443340d1d8cceb516d02c3d6dee7",
"assets/packages/font_awesome_flutter/lib/fonts/fa-solid-900.ttf": "658b490c9da97710b01bd0f8825fce94",
"assets/shaders/ink_sparkle.frag": "4096b5150bac93c41cbc9b45276bd90f",
"canvaskit/canvaskit.js": "eb8797020acdbdf96a12fb0405582c1b",
"canvaskit/canvaskit.wasm": "73584c1a3367e3eaf757647a8f5c5989",
"canvaskit/chromium/canvaskit.js": "0ae8bbcc58155679458a0f7a00f66873",
"canvaskit/chromium/canvaskit.wasm": "143af6ff368f9cd21c863bfa4274c406",
"canvaskit/skwasm.js": "87063acf45c5e1ab9565dcf06b0c18b8",
"canvaskit/skwasm.wasm": "2fc47c0a0c3c7af8542b601634fe9674",
"canvaskit/skwasm.worker.js": "bfb704a6c714a75da9ef320991e88b03",
"favicon.ico": "e0dcc976b1c5003df9fd5e550b9a03ad",
"favicon.png": "b55a970f38de8dfbe148ac37df3eb12e",
"flutter.js": "7d69e653079438abfbb24b82a655b0a4",
"Icon-192.png.png": "7cf48c2ee1097f0aec833b92eff24350",
"Icon-512.png.png": "8555e21e61ae8546ba46b0e8ccedd8f6",
"icons/Icon-192.png": "68396bc12b913673b316a371549580cd",
"icons/Icon-512.png": "20066efb9b047f26f155aed05dc4def2",
"icons/Icon-maskable-192.png": "68396bc12b913673b316a371549580cd",
"icons/Icon-maskable-512.png": "20066efb9b047f26f155aed05dc4def2",
"index.html": "e22f20bbf1d3dd32fb9378ba635119e8",
"/": "e22f20bbf1d3dd32fb9378ba635119e8",
"main.dart.js": "6d47be0624e2065c3696b8cb42048a88",
"manifest.json": "a90db607582afbf907456a0f697d33bd",
"version.json": "cc1fa9cce5af273c0909d105387fee89"};
// The application shell files that are downloaded before a service worker can
// start.
const CORE = ["main.dart.js",
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
