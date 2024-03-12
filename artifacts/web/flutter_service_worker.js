'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';

const RESOURCES = {"assets/assets/tunes/pop.mp3": "cf291c2a31eb87d47c83ce313f7273e8",
"assets/assets/icon/icon.png": "97dafbd6500197ad632a708947630418",
"assets/assets/icon/prometeo.png": "63af24f1998d8b0762af487e27808847",
"assets/assets/images/events.png": "6186051e72e89c85264a65adc9122839",
"assets/assets/images/themestone.png": "28b257c0484a01061240a9aec001ec19",
"assets/assets/images/accom.jpg": "b784e5f1a64481f247d238c5e79c36aa",
"assets/assets/images/prize.png": "a1a3f948925ff75a69ab5c3d9f09b9d7",
"assets/assets/images/link.png": "21148f161a0a2136d460d1cdfe9a9942",
"assets/assets/images/prere.png": "949cf85e48345bf69c3b35a4fe224365",
"assets/assets/images/ca.svg": "c60a223efde15f9e1096ad94733ebf65",
"assets/assets/images/prometeoLogo.png": "65d8069c3e47494f7f7cdba8f76004ee",
"assets/assets/images/sponsors.png": "d205fca501833680600a2db7efcc0198",
"assets/assets/images/google.png": "93e2bacc25fc2d6a17e58fe9e923c5e2",
"assets/assets/images/thme.png": "838f876c0b2ce7a9a86f0510864e1c78",
"assets/assets/images/entre.png": "55873fd16ceea102617944174569bc10",
"assets/assets/images/tech.png": "b3395f43383364369a2d56687c38f3f5",
"assets/assets/images/colleges.png": "94e4eda949b4ee09d153aacf77e168df",
"assets/assets/images/all.png": "c172073089ee7022be9e0ad41df0f5d5",
"assets/assets/images/events.jpg": "833ba79875a5464e9585c75a6da44b20",
"assets/assets/images/past.png": "8f25f83a9e23262830f43d0c1529519f",
"assets/assets/images/teams.jpg": "70d1f8f238f72fdd079070276eed15d8",
"assets/assets/images/speakers.png": "0aee9e1134a3481243a69d0736912acd",
"assets/assets/images/twit.png": "b9f3e79b734df75ac4c03ab15c8a7ec1",
"assets/assets/images/themback.jpg": "07890cec31bfdfa7e813d09e3307658c",
"assets/assets/images/prerna.png": "60f7aeca60081ebe20415ca9ccb6ee34",
"assets/assets/images/prometeo.png": "0cf5f1b34ebc4f272bee5b5e8a87480d",
"assets/assets/images/you.png": "033a0cb32c9948742432d3013b5904a4",
"assets/assets/images/register.jpg": "739d2ff2883a8773c0dd5d5346603889",
"assets/assets/images/preloader.gif": "95e66f8c071d72639d2d342c0945d6e3",
"assets/assets/images/insta.png": "0e5530ce5b7900e44662fbbb502408cb",
"assets/assets/images/pre.png": "4afc9b1a07a262216af3dd9498ccb94b",
"assets/assets/images/participants.png": "ac7f27eb7ce04d25424af5b149b8cf89",
"assets/assets/images/dash.png": "3f5339b7f74efddd4301fd131f91437b",
"assets/assets/images/back.png": "0849a6205babb0e137e115816962e40b",
"assets/assets/images/glimpse.png": "f8508b65104418843a60aa5be2e0a60b",
"assets/AssetManifest.bin": "9a8be9ef50a519f85d32e3a1632c0ae5",
"assets/AssetManifest.bin.json": "b3ee275a6223766ddf0b912dc8bbce9d",
"assets/shaders/ink_sparkle.frag": "ecc85a2e95f5e9f53123dcaf8cb9b6ce",
"assets/NOTICES": "1eac5af239e014d7a1523ed18f48af73",
"assets/AssetManifest.json": "40409c18f928783a38aa4e58eab653ff",
"assets/fonts/MaterialIcons-Regular.otf": "88afb79c893f4e10c9e4c79e736629b5",
"assets/packages/flutter_inappwebview/assets/t_rex_runner/t-rex.css": "5a8d0222407e388155d7d1395a75d5b9",
"assets/packages/flutter_inappwebview/assets/t_rex_runner/t-rex.html": "16911fcc170c8af1c5457940bd0bf055",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "89ed8f4e49bcdfc0b5bfc9b24591e347",
"assets/packages/fluttertoast/assets/toastify.css": "910ddaaf9712a0b0392cf7975a3b7fb5",
"assets/packages/fluttertoast/assets/toastify.js": "18cfdd77033aa55d215e8a78c090ba89",
"assets/packages/youtube_player_flutter/assets/speedometer.webp": "50448630e948b5b3998ae5a5d112622b",
"assets/packages/floating_snackbar/assets/image/flutter_02.png": "6aa8464adbaf2dc20a6e34f2695a61fc",
"assets/packages/sign_button/images/mail.png": "c9172bdda51109489593c86da58f10e8",
"assets/packages/sign_button/images/githubDark.png": "561b115749533c422a8c02e4843c73d2",
"assets/packages/sign_button/images/amazon.png": "af00fbd77763d45afd0131b85e5f78a5",
"assets/packages/sign_button/images/appleDark.png": "11238aa9e757b14b5e3460b467e6a2b4",
"assets/packages/sign_button/images/twitterX.png": "6fe57f119159e49f33816e9989b8bc87",
"assets/packages/sign_button/images/instagram.png": "6c356b0bd4b0f7f80046fc2557e85757",
"assets/packages/sign_button/images/facebookDark.png": "deface349f4fd6bece4039901e8c6c44",
"assets/packages/sign_button/images/github.png": "c67686f615f334806a07d41d594c34c1",
"assets/packages/sign_button/images/google.png": "46039fa62c3167028c4fdb86816c3363",
"assets/packages/sign_button/images/apple.png": "c82fbe8cbcecaa462da7bd30015b3565",
"assets/packages/sign_button/images/googleDark.png": "3a7df7781108618c2b3d05a5121abdfc",
"assets/packages/sign_button/images/facebook.png": "f4dfe9871ac8cce8278c2aba8c897e1d",
"assets/packages/sign_button/images/linkedin.png": "e4ae6d8c444c75a24d02cd9995072297",
"assets/packages/sign_button/images/twitter.png": "08ed456da7c064a42ed528098c78dfc0",
"assets/packages/sign_button/images/discord.png": "58b6fbbd693837c7782e3efae4619c17",
"assets/packages/sign_button/images/tumblr.png": "695506da08f97651af960af9f268dcc4",
"assets/packages/sign_button/images/yahoo.png": "8d028327c009ae90e08ebfd965176f8b",
"assets/packages/sign_button/images/microsoft.png": "dfb60902957a3204c63d4d3de2ae76ff",
"assets/packages/sign_button/images/pinterest.png": "4e9b78531f5968aad62a1ec26eb75b18",
"assets/packages/sign_button/images/youtube.png": "615f39ecf21272fec7eceb7984ed8959",
"assets/packages/sign_button/images/discordCircle.png": "eef106bd4d8b58cf3ef1d257fa53b93e",
"assets/packages/sign_button/images/reddit.png": "1b200a970d87b9ab578ac556b24cf16b",
"assets/packages/sign_button/images/quora.png": "b10aaad4707aad91cbab341ef33ea56c",
"assets/FontManifest.json": "dc3d03800ccca4601324923c0b1d6d57",
"canvaskit/skwasm.js.symbols": "741d50ffba71f89345996b0aa8426af8",
"canvaskit/canvaskit.wasm": "3d2a2d663e8c5111ac61a46367f751ac",
"canvaskit/canvaskit.js": "c86fbd9e7b17accae76e5ad116583dc4",
"canvaskit/chromium/canvaskit.wasm": "f5934e694f12929ed56a671617acd254",
"canvaskit/chromium/canvaskit.js": "43787ac5098c648979c27c13c6f804c3",
"canvaskit/chromium/canvaskit.js.symbols": "4525682ef039faeb11f24f37436dca06",
"canvaskit/skwasm.worker.js": "bfb704a6c714a75da9ef320991e88b03",
"canvaskit/skwasm.js": "445e9e400085faead4493be2224d95aa",
"canvaskit/canvaskit.js.symbols": "38cba9233b92472a36ff011dc21c2c9f",
"canvaskit/skwasm.wasm": "e42815763c5d05bba43f9d0337fa7d84",
"icons/Icon-maskable-192.png": "9a0ee872ded0e6f11c80057a1d2ce7e3",
"icons/Icon-192.png": "9a0ee872ded0e6f11c80057a1d2ce7e3",
"icons/Icon-512.png": "08899fcbf718579421e7fe67f32712cb",
"icons/Icon-maskable-512.png": "08899fcbf718579421e7fe67f32712cb",
"version.json": "3cbb5eaf2973b024c008ab3d7799b5da",
"favicon.png": "453e2781391c6c3bfe825ce71ce44cb8",
"flutter.js": "c71a09214cb6f5f8996a531350400a9a",
"manifest.json": "cbe8ec8b651b808af6aec01875b6ccb0",
"index.html": "74c57ea532b93e0ff7b9f2143999530a",
"/": "74c57ea532b93e0ff7b9f2143999530a",
"main.dart.js": "8f172b2a5af9907a75a1219cc3e54fad"};
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
