//= require jquery
//= require rails-ujs
//= require bootstrap-sprockets
//= require bootstrap
//= require_tree .

import 'bootstrap'
require ("@rails/ujs").start()
require ("turbolinks").start()
require ("@rails/activestorage").start()
require ("channels")
require ("packs/custom")
require ("packs/post.js")