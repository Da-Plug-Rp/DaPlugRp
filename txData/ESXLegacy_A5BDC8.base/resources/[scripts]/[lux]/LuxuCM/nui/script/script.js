(function polyfill() {
  const relList = document.createElement("link").relList;
  if (relList && relList.supports && relList.supports("modulepreload")) {
    return;
  }
  for (const link of document.querySelectorAll('link[rel="modulepreload"]')) {
    processPreload(link);
  }
  new MutationObserver((mutations) => {
    for (const mutation of mutations) {
      if (mutation.type !== "childList") {
        continue;
      }
      for (const node of mutation.addedNodes) {
        if (node.tagName === "LINK" && node.rel === "modulepreload")
          processPreload(node);
      }
    }
  }).observe(document, { childList: true, subtree: true });
  function getFetchOpts(script) {
    const fetchOpts = {};
    if (script.integrity)
      fetchOpts.integrity = script.integrity;
    if (script.referrerpolicy)
      fetchOpts.referrerPolicy = script.referrerpolicy;
    if (script.crossorigin === "use-credentials")
      fetchOpts.credentials = "include";
    else if (script.crossorigin === "anonymous")
      fetchOpts.credentials = "omit";
    else
      fetchOpts.credentials = "same-origin";
    return fetchOpts;
  }
  function processPreload(link) {
    if (link.ep)
      return;
    link.ep = true;
    const fetchOpts = getFetchOpts(link);
    fetch(link.href, fetchOpts);
  }
})();
const app = "";
function noop() {
}
const identity = (x) => x;
function assign(tar, src) {
  for (const k in src)
    tar[k] = src[k];
  return tar;
}
function run(fn) {
  return fn();
}
function blank_object() {
  return /* @__PURE__ */ Object.create(null);
}
function run_all(fns) {
  fns.forEach(run);
}
function is_function(thing) {
  return typeof thing === "function";
}
function safe_not_equal(a, b) {
  return a != a ? b == b : a !== b || (a && typeof a === "object" || typeof a === "function");
}
let src_url_equal_anchor;
function src_url_equal(element_src, url) {
  if (!src_url_equal_anchor) {
    src_url_equal_anchor = document.createElement("a");
  }
  src_url_equal_anchor.href = url;
  return element_src === src_url_equal_anchor.href;
}
function is_empty(obj) {
  return Object.keys(obj).length === 0;
}
function subscribe(store, ...callbacks) {
  if (store == null) {
    return noop;
  }
  const unsub = store.subscribe(...callbacks);
  return unsub.unsubscribe ? () => unsub.unsubscribe() : unsub;
}
function get_store_value(store) {
  let value;
  subscribe(store, (_) => value = _)();
  return value;
}
function component_subscribe(component, store, callback) {
  component.$$.on_destroy.push(subscribe(store, callback));
}
function create_slot(definition, ctx, $$scope, fn) {
  if (definition) {
    const slot_ctx = get_slot_context(definition, ctx, $$scope, fn);
    return definition[0](slot_ctx);
  }
}
function get_slot_context(definition, ctx, $$scope, fn) {
  return definition[1] && fn ? assign($$scope.ctx.slice(), definition[1](fn(ctx))) : $$scope.ctx;
}
function get_slot_changes(definition, $$scope, dirty, fn) {
  if (definition[2] && fn) {
    const lets = definition[2](fn(dirty));
    if ($$scope.dirty === void 0) {
      return lets;
    }
    if (typeof lets === "object") {
      const merged = [];
      const len = Math.max($$scope.dirty.length, lets.length);
      for (let i = 0; i < len; i += 1) {
        merged[i] = $$scope.dirty[i] | lets[i];
      }
      return merged;
    }
    return $$scope.dirty | lets;
  }
  return $$scope.dirty;
}
function update_slot_base(slot, slot_definition, ctx, $$scope, slot_changes, get_slot_context_fn) {
  if (slot_changes) {
    const slot_context = get_slot_context(slot_definition, ctx, $$scope, get_slot_context_fn);
    slot.p(slot_context, slot_changes);
  }
}
function get_all_dirty_from_scope($$scope) {
  if ($$scope.ctx.length > 32) {
    const dirty = [];
    const length = $$scope.ctx.length / 32;
    for (let i = 0; i < length; i++) {
      dirty[i] = -1;
    }
    return dirty;
  }
  return -1;
}
function set_store_value(store, ret, value) {
  store.set(value);
  return ret;
}
function action_destroyer(action_result) {
  return action_result && is_function(action_result.destroy) ? action_result.destroy : noop;
}
const is_client = typeof window !== "undefined";
let now = is_client ? () => window.performance.now() : () => Date.now();
let raf = is_client ? (cb) => requestAnimationFrame(cb) : noop;
const tasks = /* @__PURE__ */ new Set();
function run_tasks(now2) {
  tasks.forEach((task) => {
    if (!task.c(now2)) {
      tasks.delete(task);
      task.f();
    }
  });
  if (tasks.size !== 0)
    raf(run_tasks);
}
function loop(callback) {
  let task;
  if (tasks.size === 0)
    raf(run_tasks);
  return {
    promise: new Promise((fulfill) => {
      tasks.add(task = { c: callback, f: fulfill });
    }),
    abort() {
      tasks.delete(task);
    }
  };
}
function append(target, node) {
  target.appendChild(node);
}
function get_root_for_style(node) {
  if (!node)
    return document;
  const root = node.getRootNode ? node.getRootNode() : node.ownerDocument;
  if (root && root.host) {
    return root;
  }
  return node.ownerDocument;
}
function append_empty_stylesheet(node) {
  const style_element = element("style");
  append_stylesheet(get_root_for_style(node), style_element);
  return style_element.sheet;
}
function append_stylesheet(node, style) {
  append(node.head || node, style);
  return style.sheet;
}
function insert(target, node, anchor) {
  target.insertBefore(node, anchor || null);
}
function detach(node) {
  if (node.parentNode) {
    node.parentNode.removeChild(node);
  }
}
function destroy_each(iterations, detaching) {
  for (let i = 0; i < iterations.length; i += 1) {
    if (iterations[i])
      iterations[i].d(detaching);
  }
}
function element(name) {
  return document.createElement(name);
}
function text(data) {
  return document.createTextNode(data);
}
function space() {
  return text(" ");
}
function empty() {
  return text("");
}
function listen(node, event, handler, options) {
  node.addEventListener(event, handler, options);
  return () => node.removeEventListener(event, handler, options);
}
function prevent_default(fn) {
  return function(event) {
    event.preventDefault();
    return fn.call(this, event);
  };
}
function attr(node, attribute, value) {
  if (value == null)
    node.removeAttribute(attribute);
  else if (node.getAttribute(attribute) !== value)
    node.setAttribute(attribute, value);
}
function to_number(value) {
  return value === "" ? null : +value;
}
function children(element2) {
  return Array.from(element2.childNodes);
}
function set_data(text2, data) {
  data = "" + data;
  if (text2.wholeText !== data)
    text2.data = data;
}
function set_input_value(input, value) {
  input.value = value == null ? "" : value;
}
function set_style(node, key, value, important) {
  if (value === null) {
    node.style.removeProperty(key);
  } else {
    node.style.setProperty(key, value, important ? "important" : "");
  }
}
function toggle_class(element2, name, toggle) {
  element2.classList[toggle ? "add" : "remove"](name);
}
function custom_event(type, detail, { bubbles = false, cancelable = false } = {}) {
  const e = document.createEvent("CustomEvent");
  e.initCustomEvent(type, bubbles, cancelable, detail);
  return e;
}
function construct_svelte_component(component, props) {
  return new component(props);
}
const managed_styles = /* @__PURE__ */ new Map();
let active$1 = 0;
function hash(str) {
  let hash2 = 5381;
  let i = str.length;
  while (i--)
    hash2 = (hash2 << 5) - hash2 ^ str.charCodeAt(i);
  return hash2 >>> 0;
}
function create_style_information(doc, node) {
  const info = { stylesheet: append_empty_stylesheet(node), rules: {} };
  managed_styles.set(doc, info);
  return info;
}
function create_rule(node, a, b, duration, delay, ease, fn, uid = 0) {
  const step = 16.666 / duration;
  let keyframes = "{\n";
  for (let p = 0; p <= 1; p += step) {
    const t = a + (b - a) * ease(p);
    keyframes += p * 100 + `%{${fn(t, 1 - t)}}
`;
  }
  const rule = keyframes + `100% {${fn(b, 1 - b)}}
}`;
  const name = `__svelte_${hash(rule)}_${uid}`;
  const doc = get_root_for_style(node);
  const { stylesheet, rules } = managed_styles.get(doc) || create_style_information(doc, node);
  if (!rules[name]) {
    rules[name] = true;
    stylesheet.insertRule(`@keyframes ${name} ${rule}`, stylesheet.cssRules.length);
  }
  const animation = node.style.animation || "";
  node.style.animation = `${animation ? `${animation}, ` : ""}${name} ${duration}ms linear ${delay}ms 1 both`;
  active$1 += 1;
  return name;
}
function delete_rule(node, name) {
  const previous = (node.style.animation || "").split(", ");
  const next = previous.filter(
    name ? (anim) => anim.indexOf(name) < 0 : (anim) => anim.indexOf("__svelte") === -1
  );
  const deleted = previous.length - next.length;
  if (deleted) {
    node.style.animation = next.join(", ");
    active$1 -= deleted;
    if (!active$1)
      clear_rules();
  }
}
function clear_rules() {
  raf(() => {
    if (active$1)
      return;
    managed_styles.forEach((info) => {
      const { ownerNode } = info.stylesheet;
      if (ownerNode)
        detach(ownerNode);
    });
    managed_styles.clear();
  });
}
let current_component;
function set_current_component(component) {
  current_component = component;
}
function get_current_component() {
  if (!current_component)
    throw new Error("Function called outside component initialization");
  return current_component;
}
function onMount(fn) {
  get_current_component().$$.on_mount.push(fn);
}
function afterUpdate(fn) {
  get_current_component().$$.after_update.push(fn);
}
function onDestroy(fn) {
  get_current_component().$$.on_destroy.push(fn);
}
function createEventDispatcher() {
  const component = get_current_component();
  return (type, detail, { cancelable = false } = {}) => {
    const callbacks = component.$$.callbacks[type];
    if (callbacks) {
      const event = custom_event(type, detail, { cancelable });
      callbacks.slice().forEach((fn) => {
        fn.call(component, event);
      });
      return !event.defaultPrevented;
    }
    return true;
  };
}
function setContext(key, context) {
  get_current_component().$$.context.set(key, context);
  return context;
}
function getContext(key) {
  return get_current_component().$$.context.get(key);
}
function bubble(component, event) {
  const callbacks = component.$$.callbacks[event.type];
  if (callbacks) {
    callbacks.slice().forEach((fn) => fn.call(this, event));
  }
}
const dirty_components = [];
const binding_callbacks = [];
const render_callbacks = [];
const flush_callbacks = [];
const resolved_promise = Promise.resolve();
let update_scheduled = false;
function schedule_update() {
  if (!update_scheduled) {
    update_scheduled = true;
    resolved_promise.then(flush);
  }
}
function tick() {
  schedule_update();
  return resolved_promise;
}
function add_render_callback(fn) {
  render_callbacks.push(fn);
}
const seen_callbacks = /* @__PURE__ */ new Set();
let flushidx = 0;
function flush() {
  const saved_component = current_component;
  do {
    while (flushidx < dirty_components.length) {
      const component = dirty_components[flushidx];
      flushidx++;
      set_current_component(component);
      update(component.$$);
    }
    set_current_component(null);
    dirty_components.length = 0;
    flushidx = 0;
    while (binding_callbacks.length)
      binding_callbacks.pop()();
    for (let i = 0; i < render_callbacks.length; i += 1) {
      const callback = render_callbacks[i];
      if (!seen_callbacks.has(callback)) {
        seen_callbacks.add(callback);
        callback();
      }
    }
    render_callbacks.length = 0;
  } while (dirty_components.length);
  while (flush_callbacks.length) {
    flush_callbacks.pop()();
  }
  update_scheduled = false;
  seen_callbacks.clear();
  set_current_component(saved_component);
}
function update($$) {
  if ($$.fragment !== null) {
    $$.update();
    run_all($$.before_update);
    const dirty = $$.dirty;
    $$.dirty = [-1];
    $$.fragment && $$.fragment.p($$.ctx, dirty);
    $$.after_update.forEach(add_render_callback);
  }
}
let promise;
function wait() {
  if (!promise) {
    promise = Promise.resolve();
    promise.then(() => {
      promise = null;
    });
  }
  return promise;
}
function dispatch(node, direction, kind) {
  node.dispatchEvent(custom_event(`${direction ? "intro" : "outro"}${kind}`));
}
const outroing = /* @__PURE__ */ new Set();
let outros;
function group_outros() {
  outros = {
    r: 0,
    c: [],
    p: outros
  };
}
function check_outros() {
  if (!outros.r) {
    run_all(outros.c);
  }
  outros = outros.p;
}
function transition_in(block, local) {
  if (block && block.i) {
    outroing.delete(block);
    block.i(local);
  }
}
function transition_out(block, local, detach2, callback) {
  if (block && block.o) {
    if (outroing.has(block))
      return;
    outroing.add(block);
    outros.c.push(() => {
      outroing.delete(block);
      if (callback) {
        if (detach2)
          block.d(1);
        callback();
      }
    });
    block.o(local);
  } else if (callback) {
    callback();
  }
}
const null_transition = { duration: 0 };
function create_in_transition(node, fn, params2) {
  let config = fn(node, params2);
  let running = false;
  let animation_name;
  let task;
  let uid = 0;
  function cleanup() {
    if (animation_name)
      delete_rule(node, animation_name);
  }
  function go() {
    const { delay = 0, duration = 300, easing = identity, tick: tick2 = noop, css } = config || null_transition;
    if (css)
      animation_name = create_rule(node, 0, 1, duration, delay, easing, css, uid++);
    tick2(0, 1);
    const start_time = now() + delay;
    const end_time = start_time + duration;
    if (task)
      task.abort();
    running = true;
    add_render_callback(() => dispatch(node, true, "start"));
    task = loop((now2) => {
      if (running) {
        if (now2 >= end_time) {
          tick2(1, 0);
          dispatch(node, true, "end");
          cleanup();
          return running = false;
        }
        if (now2 >= start_time) {
          const t = easing((now2 - start_time) / duration);
          tick2(t, 1 - t);
        }
      }
      return running;
    });
  }
  let started = false;
  return {
    start() {
      if (started)
        return;
      started = true;
      delete_rule(node);
      if (is_function(config)) {
        config = config();
        wait().then(go);
      } else {
        go();
      }
    },
    invalidate() {
      started = false;
    },
    end() {
      if (running) {
        cleanup();
        running = false;
      }
    }
  };
}
function create_bidirectional_transition(node, fn, params2, intro) {
  let config = fn(node, params2);
  let t = intro ? 0 : 1;
  let running_program = null;
  let pending_program = null;
  let animation_name = null;
  function clear_animation() {
    if (animation_name)
      delete_rule(node, animation_name);
  }
  function init2(program, duration) {
    const d = program.b - t;
    duration *= Math.abs(d);
    return {
      a: t,
      b: program.b,
      d,
      duration,
      start: program.start,
      end: program.start + duration,
      group: program.group
    };
  }
  function go(b) {
    const { delay = 0, duration = 300, easing = identity, tick: tick2 = noop, css } = config || null_transition;
    const program = {
      start: now() + delay,
      b
    };
    if (!b) {
      program.group = outros;
      outros.r += 1;
    }
    if (running_program || pending_program) {
      pending_program = program;
    } else {
      if (css) {
        clear_animation();
        animation_name = create_rule(node, t, b, duration, delay, easing, css);
      }
      if (b)
        tick2(0, 1);
      running_program = init2(program, duration);
      add_render_callback(() => dispatch(node, b, "start"));
      loop((now2) => {
        if (pending_program && now2 > pending_program.start) {
          running_program = init2(pending_program, duration);
          pending_program = null;
          dispatch(node, running_program.b, "start");
          if (css) {
            clear_animation();
            animation_name = create_rule(node, t, running_program.b, running_program.duration, 0, easing, config.css);
          }
        }
        if (running_program) {
          if (now2 >= running_program.end) {
            tick2(t = running_program.b, 1 - t);
            dispatch(node, running_program.b, "end");
            if (!pending_program) {
              if (running_program.b) {
                clear_animation();
              } else {
                if (!--running_program.group.r)
                  run_all(running_program.group.c);
              }
            }
            running_program = null;
          } else if (now2 >= running_program.start) {
            const p = now2 - running_program.start;
            t = running_program.a + running_program.d * easing(p / running_program.duration);
            tick2(t, 1 - t);
          }
        }
        return !!(running_program || pending_program);
      });
    }
  }
  return {
    run(b) {
      if (is_function(config)) {
        wait().then(() => {
          config = config();
          go(b);
        });
      } else {
        go(b);
      }
    },
    end() {
      clear_animation();
      running_program = pending_program = null;
    }
  };
}
function destroy_block(block, lookup) {
  block.d(1);
  lookup.delete(block.key);
}
function update_keyed_each(old_blocks, dirty, get_key, dynamic, ctx, list, lookup, node, destroy, create_each_block2, next, get_context) {
  let o = old_blocks.length;
  let n = list.length;
  let i = o;
  const old_indexes = {};
  while (i--)
    old_indexes[old_blocks[i].key] = i;
  const new_blocks = [];
  const new_lookup = /* @__PURE__ */ new Map();
  const deltas = /* @__PURE__ */ new Map();
  i = n;
  while (i--) {
    const child_ctx = get_context(ctx, list, i);
    const key = get_key(child_ctx);
    let block = lookup.get(key);
    if (!block) {
      block = create_each_block2(key, child_ctx);
      block.c();
    } else if (dynamic) {
      block.p(child_ctx, dirty);
    }
    new_lookup.set(key, new_blocks[i] = block);
    if (key in old_indexes)
      deltas.set(key, Math.abs(i - old_indexes[key]));
  }
  const will_move = /* @__PURE__ */ new Set();
  const did_move = /* @__PURE__ */ new Set();
  function insert2(block) {
    transition_in(block, 1);
    block.m(node, next);
    lookup.set(block.key, block);
    next = block.first;
    n--;
  }
  while (o && n) {
    const new_block = new_blocks[n - 1];
    const old_block = old_blocks[o - 1];
    const new_key = new_block.key;
    const old_key = old_block.key;
    if (new_block === old_block) {
      next = new_block.first;
      o--;
      n--;
    } else if (!new_lookup.has(old_key)) {
      destroy(old_block, lookup);
      o--;
    } else if (!lookup.has(new_key) || will_move.has(new_key)) {
      insert2(new_block);
    } else if (did_move.has(old_key)) {
      o--;
    } else if (deltas.get(new_key) > deltas.get(old_key)) {
      did_move.add(new_key);
      insert2(new_block);
    } else {
      will_move.add(old_key);
      o--;
    }
  }
  while (o--) {
    const old_block = old_blocks[o];
    if (!new_lookup.has(old_block.key))
      destroy(old_block, lookup);
  }
  while (n)
    insert2(new_blocks[n - 1]);
  return new_blocks;
}
function get_spread_update(levels, updates) {
  const update2 = {};
  const to_null_out = {};
  const accounted_for = { $$scope: 1 };
  let i = levels.length;
  while (i--) {
    const o = levels[i];
    const n = updates[i];
    if (n) {
      for (const key in o) {
        if (!(key in n))
          to_null_out[key] = 1;
      }
      for (const key in n) {
        if (!accounted_for[key]) {
          update2[key] = n[key];
          accounted_for[key] = 1;
        }
      }
      levels[i] = n;
    } else {
      for (const key in o) {
        accounted_for[key] = 1;
      }
    }
  }
  for (const key in to_null_out) {
    if (!(key in update2))
      update2[key] = void 0;
  }
  return update2;
}
function get_spread_object(spread_props) {
  return typeof spread_props === "object" && spread_props !== null ? spread_props : {};
}
function create_component(block) {
  block && block.c();
}
function mount_component(component, target, anchor, customElement) {
  const { fragment, after_update } = component.$$;
  fragment && fragment.m(target, anchor);
  if (!customElement) {
    add_render_callback(() => {
      const new_on_destroy = component.$$.on_mount.map(run).filter(is_function);
      if (component.$$.on_destroy) {
        component.$$.on_destroy.push(...new_on_destroy);
      } else {
        run_all(new_on_destroy);
      }
      component.$$.on_mount = [];
    });
  }
  after_update.forEach(add_render_callback);
}
function destroy_component(component, detaching) {
  const $$ = component.$$;
  if ($$.fragment !== null) {
    run_all($$.on_destroy);
    $$.fragment && $$.fragment.d(detaching);
    $$.on_destroy = $$.fragment = null;
    $$.ctx = [];
  }
}
function make_dirty(component, i) {
  if (component.$$.dirty[0] === -1) {
    dirty_components.push(component);
    schedule_update();
    component.$$.dirty.fill(0);
  }
  component.$$.dirty[i / 31 | 0] |= 1 << i % 31;
}
function init(component, options, instance2, create_fragment2, not_equal, props, append_styles, dirty = [-1]) {
  const parent_component = current_component;
  set_current_component(component);
  const $$ = component.$$ = {
    fragment: null,
    ctx: [],
    props,
    update: noop,
    not_equal,
    bound: blank_object(),
    on_mount: [],
    on_destroy: [],
    on_disconnect: [],
    before_update: [],
    after_update: [],
    context: new Map(options.context || (parent_component ? parent_component.$$.context : [])),
    callbacks: blank_object(),
    dirty,
    skip_bound: false,
    root: options.target || parent_component.$$.root
  };
  append_styles && append_styles($$.root);
  let ready = false;
  $$.ctx = instance2 ? instance2(component, options.props || {}, (i, ret, ...rest) => {
    const value = rest.length ? rest[0] : ret;
    if ($$.ctx && not_equal($$.ctx[i], $$.ctx[i] = value)) {
      if (!$$.skip_bound && $$.bound[i])
        $$.bound[i](value);
      if (ready)
        make_dirty(component, i);
    }
    return ret;
  }) : [];
  $$.update();
  ready = true;
  run_all($$.before_update);
  $$.fragment = create_fragment2 ? create_fragment2($$.ctx) : false;
  if (options.target) {
    if (options.hydrate) {
      const nodes2 = children(options.target);
      $$.fragment && $$.fragment.l(nodes2);
      nodes2.forEach(detach);
    } else {
      $$.fragment && $$.fragment.c();
    }
    if (options.intro)
      transition_in(component.$$.fragment);
    mount_component(component, options.target, options.anchor, options.customElement);
    flush();
  }
  set_current_component(parent_component);
}
class SvelteComponent {
  $destroy() {
    destroy_component(this, 1);
    this.$destroy = noop;
  }
  $on(type, callback) {
    if (!is_function(callback)) {
      return noop;
    }
    const callbacks = this.$$.callbacks[type] || (this.$$.callbacks[type] = []);
    callbacks.push(callback);
    return () => {
      const index = callbacks.indexOf(callback);
      if (index !== -1)
        callbacks.splice(index, 1);
    };
  }
  $set($$props) {
    if (this.$$set && !is_empty($$props)) {
      this.$$.skip_bound = true;
      this.$$set($$props);
      this.$$.skip_bound = false;
    }
  }
}
const subscriber_queue = [];
function readable(value, start3) {
  return {
    subscribe: writable(value, start3).subscribe
  };
}
function writable(value, start3 = noop) {
  let stop;
  const subscribers = /* @__PURE__ */ new Set();
  function set(new_value) {
    if (safe_not_equal(value, new_value)) {
      value = new_value;
      if (stop) {
        const run_queue = !subscriber_queue.length;
        for (const subscriber of subscribers) {
          subscriber[1]();
          subscriber_queue.push(subscriber, value);
        }
        if (run_queue) {
          for (let i = 0; i < subscriber_queue.length; i += 2) {
            subscriber_queue[i][0](subscriber_queue[i + 1]);
          }
          subscriber_queue.length = 0;
        }
      }
    }
  }
  function update2(fn) {
    set(fn(value));
  }
  function subscribe2(run2, invalidate = noop) {
    const subscriber = [run2, invalidate];
    subscribers.add(subscriber);
    if (subscribers.size === 1) {
      stop = start3(set) || noop;
    }
    run2(value);
    return () => {
      subscribers.delete(subscriber);
      if (subscribers.size === 0) {
        stop();
        stop = null;
      }
    };
  }
  return { set, update: update2, subscribe: subscribe2 };
}
function derived(stores, fn, initial_value) {
  const single = !Array.isArray(stores);
  const stores_array = single ? [stores] : stores;
  const auto = fn.length < 2;
  return readable(initial_value, (set) => {
    let inited = false;
    const values = [];
    let pending = 0;
    let cleanup = noop;
    const sync = () => {
      if (pending) {
        return;
      }
      cleanup();
      const result = fn(single ? values[0] : values, set);
      if (auto) {
        set(result);
      } else {
        cleanup = is_function(result) ? result : noop;
      }
    };
    const unsubscribers = stores_array.map((store, i) => subscribe(store, (value) => {
      values[i] = value;
      pending &= ~(1 << i);
      if (inited) {
        sync();
      }
    }, () => {
      pending |= 1 << i;
    }));
    inited = true;
    sync();
    return function stop() {
      run_all(unsubscribers);
      cleanup();
    };
  });
}
function fade(node, { delay = 0, duration = 400, easing = identity } = {}) {
  const o = +getComputedStyle(node).opacity;
  return {
    delay,
    duration,
    easing,
    css: (t) => `opacity: ${t * o}`
  };
}
function parse(str, loose) {
  if (str instanceof RegExp)
    return { keys: false, pattern: str };
  var c, o, tmp, ext, keys = [], pattern = "", arr = str.split("/");
  arr[0] || arr.shift();
  while (tmp = arr.shift()) {
    c = tmp[0];
    if (c === "*") {
      keys.push("wild");
      pattern += "/(.*)";
    } else if (c === ":") {
      o = tmp.indexOf("?", 1);
      ext = tmp.indexOf(".", 1);
      keys.push(tmp.substring(1, !!~o ? o : !!~ext ? ext : tmp.length));
      pattern += !!~o && !~ext ? "(?:/([^/]+?))?" : "/([^/]+?)";
      if (!!~ext)
        pattern += (!!~o ? "?" : "") + "\\" + tmp.substring(ext);
    } else {
      pattern += "/" + tmp;
    }
  }
  return {
    keys,
    pattern: new RegExp("^" + pattern + (loose ? "(?=$|/)" : "/?$"), "i")
  };
}
function getLocation$1() {
  const hashPosition = window.location.href.indexOf("#/");
  let location2 = hashPosition > -1 ? window.location.href.substr(hashPosition + 1) : "/";
  const qsPosition = location2.indexOf("?");
  let querystring = "";
  if (qsPosition > -1) {
    querystring = location2.substr(qsPosition + 1);
    location2 = location2.substr(0, qsPosition);
  }
  return { location: location2, querystring };
}
const loc$1 = readable(
  null,
  function start(set) {
    set(getLocation$1());
    const update2 = () => {
      set(getLocation$1());
    };
    window.addEventListener("hashchange", update2, false);
    return function stop() {
      window.removeEventListener("hashchange", update2, false);
    };
  }
);
derived(loc$1, ($loc) => $loc.location);
derived(loc$1, ($loc) => $loc.querystring);
const nodes = [];
let location;
function checkActive(el) {
  const matchesLocation = el.pattern.test(location);
  toggleClasses(el, el.className, matchesLocation);
  toggleClasses(el, el.inactiveClassName, !matchesLocation);
}
function toggleClasses(el, className, shouldAdd) {
  (className || "").split(" ").forEach((cls) => {
    if (!cls) {
      return;
    }
    el.node.classList.remove(cls);
    if (shouldAdd) {
      el.node.classList.add(cls);
    }
  });
}
loc$1.subscribe((value) => {
  location = value.location + (value.querystring ? "?" + value.querystring : "");
  nodes.map(checkActive);
});
function active(node, opts) {
  if (opts && (typeof opts == "string" || typeof opts == "object" && opts instanceof RegExp)) {
    opts = {
      path: opts
    };
  } else {
    opts = opts || {};
  }
  if (!opts.path && node.hasAttribute("href")) {
    opts.path = node.getAttribute("href");
    if (opts.path && opts.path.length > 1 && opts.path.charAt(0) == "#") {
      opts.path = opts.path.substring(1);
    }
  }
  if (!opts.className) {
    opts.className = "active";
  }
  if (!opts.path || typeof opts.path == "string" && (opts.path.length < 1 || opts.path.charAt(0) != "/" && opts.path.charAt(0) != "*")) {
    throw Error('Invalid value for "path" argument');
  }
  const { pattern } = typeof opts.path == "string" ? parse(opts.path) : { pattern: opts.path };
  const el = {
    node,
    className: opts.className,
    inactiveClassName: opts.inactiveClassName,
    pattern
  };
  nodes.push(el);
  checkActive(el);
  return {
    destroy() {
      nodes.splice(nodes.indexOf(el), 1);
    }
  };
}
const Nui = {
  async send(event, data = {}) {
    const resource = window.GetParentResourceName ? window.GetParentResourceName() : "nui-frame-app";
    return await fetch(`https://${resource}/${event}`, {
      method: "post",
      headers: {
        "Content-type": "application/json; charset=UTF-8"
      },
      body: JSON.stringify(data)
    });
  },
  emulate(type, data = null) {
    window.dispatchEvent(
      new MessageEvent("message", {
        data: {
          type,
          data
        }
      })
    );
  }
};
var themeChange = { exports: {} };
(function(module, exports) {
  function themeToggle() {
    var toggleEl = document.querySelector("[data-toggle-theme]");
    (function(theme = localStorage.getItem("theme")) {
      if (localStorage.getItem("theme")) {
        document.documentElement.setAttribute("data-theme", theme);
        if (toggleEl) {
          [...document.querySelectorAll("[data-toggle-theme]")].forEach((el) => {
            el.classList.add(toggleEl.getAttribute("data-act-class"));
          });
        }
      }
    })();
    if (toggleEl) {
      [...document.querySelectorAll("[data-toggle-theme]")].forEach((el) => {
        el.addEventListener("click", function() {
          var themesList = el.getAttribute("data-toggle-theme");
          if (themesList) {
            var themesArray = themesList.split(",");
            if (document.documentElement.getAttribute("data-theme") == themesArray[0]) {
              if (themesArray.length == 1) {
                document.documentElement.removeAttribute("data-theme");
                localStorage.removeItem("theme");
              } else {
                document.documentElement.setAttribute("data-theme", themesArray[1]);
                localStorage.setItem("theme", themesArray[1]);
              }
            } else {
              document.documentElement.setAttribute("data-theme", themesArray[0]);
              localStorage.setItem("theme", themesArray[0]);
            }
          }
          [...document.querySelectorAll("[data-toggle-theme]")].forEach((el2) => {
            el2.classList.toggle(this.getAttribute("data-act-class"));
          });
        });
      });
    }
  }
  function themeBtn() {
    (function(theme = localStorage.getItem("theme")) {
      if (theme != void 0 && theme != "") {
        if (localStorage.getItem("theme") && localStorage.getItem("theme") != "") {
          document.documentElement.setAttribute("data-theme", theme);
          var btnEl = document.querySelector("[data-set-theme='" + theme.toString() + "']");
          if (btnEl) {
            [...document.querySelectorAll("[data-set-theme]")].forEach((el) => {
              el.classList.remove(el.getAttribute("data-act-class"));
            });
            if (btnEl.getAttribute("data-act-class")) {
              btnEl.classList.add(btnEl.getAttribute("data-act-class"));
            }
          }
        } else {
          var btnEl = document.querySelector("[data-set-theme='']");
          if (btnEl.getAttribute("data-act-class")) {
            btnEl.classList.add(btnEl.getAttribute("data-act-class"));
          }
        }
      }
    })();
    [...document.querySelectorAll("[data-set-theme]")].forEach((el) => {
      el.addEventListener("click", function() {
        document.documentElement.setAttribute("data-theme", this.getAttribute("data-set-theme"));
        localStorage.setItem("theme", document.documentElement.getAttribute("data-theme"));
        [...document.querySelectorAll("[data-set-theme]")].forEach((el2) => {
          el2.classList.remove(el2.getAttribute("data-act-class"));
        });
        if (el.getAttribute("data-act-class")) {
          el.classList.add(el.getAttribute("data-act-class"));
        }
      });
    });
  }
  function themeSelect() {
    (function(theme = localStorage.getItem("theme")) {
      if (localStorage.getItem("theme")) {
        document.documentElement.setAttribute("data-theme", theme);
        var optionToggler = document.querySelector("select[data-choose-theme] [value='" + theme.toString() + "']");
        if (optionToggler) {
          [...document.querySelectorAll("select[data-choose-theme] [value='" + theme.toString() + "']")].forEach((el) => {
            el.selected = true;
          });
        }
      }
    })();
    if (document.querySelector("select[data-choose-theme]")) {
      [...document.querySelectorAll("select[data-choose-theme]")].forEach((el) => {
        el.addEventListener("change", function() {
          document.documentElement.setAttribute("data-theme", this.value);
          localStorage.setItem("theme", document.documentElement.getAttribute("data-theme"));
          [...document.querySelectorAll("select[data-choose-theme] [value='" + localStorage.getItem("theme") + "']")].forEach((el2) => {
            el2.selected = true;
          });
        });
      });
    }
  }
  function themeChange2(attach = true) {
    if (attach === true) {
      document.addEventListener("DOMContentLoaded", function(event) {
        themeToggle();
        themeSelect();
        themeBtn();
      });
    } else {
      themeToggle();
      themeSelect();
      themeBtn();
    }
  }
  {
    module.exports = { themeChange: themeChange2 };
  }
})(themeChange);
function create_else_block$5(ctx) {
  let switch_instance;
  let switch_instance_anchor;
  let current;
  const switch_instance_spread_levels = [ctx[2]];
  var switch_value = ctx[0];
  function switch_props(ctx2) {
    let switch_instance_props = {};
    for (let i = 0; i < switch_instance_spread_levels.length; i += 1) {
      switch_instance_props = assign(switch_instance_props, switch_instance_spread_levels[i]);
    }
    return { props: switch_instance_props };
  }
  if (switch_value) {
    switch_instance = construct_svelte_component(switch_value, switch_props());
    switch_instance.$on("routeEvent", ctx[7]);
  }
  return {
    c() {
      if (switch_instance)
        create_component(switch_instance.$$.fragment);
      switch_instance_anchor = empty();
    },
    m(target, anchor) {
      if (switch_instance)
        mount_component(switch_instance, target, anchor);
      insert(target, switch_instance_anchor, anchor);
      current = true;
    },
    p(ctx2, dirty) {
      const switch_instance_changes = dirty & 4 ? get_spread_update(switch_instance_spread_levels, [get_spread_object(ctx2[2])]) : {};
      if (switch_value !== (switch_value = ctx2[0])) {
        if (switch_instance) {
          group_outros();
          const old_component = switch_instance;
          transition_out(old_component.$$.fragment, 1, 0, () => {
            destroy_component(old_component, 1);
          });
          check_outros();
        }
        if (switch_value) {
          switch_instance = construct_svelte_component(switch_value, switch_props());
          switch_instance.$on("routeEvent", ctx2[7]);
          create_component(switch_instance.$$.fragment);
          transition_in(switch_instance.$$.fragment, 1);
          mount_component(switch_instance, switch_instance_anchor.parentNode, switch_instance_anchor);
        } else {
          switch_instance = null;
        }
      } else if (switch_value) {
        switch_instance.$set(switch_instance_changes);
      }
    },
    i(local) {
      if (current)
        return;
      if (switch_instance)
        transition_in(switch_instance.$$.fragment, local);
      current = true;
    },
    o(local) {
      if (switch_instance)
        transition_out(switch_instance.$$.fragment, local);
      current = false;
    },
    d(detaching) {
      if (detaching)
        detach(switch_instance_anchor);
      if (switch_instance)
        destroy_component(switch_instance, detaching);
    }
  };
}
function create_if_block$b(ctx) {
  let switch_instance;
  let switch_instance_anchor;
  let current;
  const switch_instance_spread_levels = [{ params: ctx[1] }, ctx[2]];
  var switch_value = ctx[0];
  function switch_props(ctx2) {
    let switch_instance_props = {};
    for (let i = 0; i < switch_instance_spread_levels.length; i += 1) {
      switch_instance_props = assign(switch_instance_props, switch_instance_spread_levels[i]);
    }
    return { props: switch_instance_props };
  }
  if (switch_value) {
    switch_instance = construct_svelte_component(switch_value, switch_props());
    switch_instance.$on("routeEvent", ctx[6]);
  }
  return {
    c() {
      if (switch_instance)
        create_component(switch_instance.$$.fragment);
      switch_instance_anchor = empty();
    },
    m(target, anchor) {
      if (switch_instance)
        mount_component(switch_instance, target, anchor);
      insert(target, switch_instance_anchor, anchor);
      current = true;
    },
    p(ctx2, dirty) {
      const switch_instance_changes = dirty & 6 ? get_spread_update(switch_instance_spread_levels, [
        dirty & 2 && { params: ctx2[1] },
        dirty & 4 && get_spread_object(ctx2[2])
      ]) : {};
      if (switch_value !== (switch_value = ctx2[0])) {
        if (switch_instance) {
          group_outros();
          const old_component = switch_instance;
          transition_out(old_component.$$.fragment, 1, 0, () => {
            destroy_component(old_component, 1);
          });
          check_outros();
        }
        if (switch_value) {
          switch_instance = construct_svelte_component(switch_value, switch_props());
          switch_instance.$on("routeEvent", ctx2[6]);
          create_component(switch_instance.$$.fragment);
          transition_in(switch_instance.$$.fragment, 1);
          mount_component(switch_instance, switch_instance_anchor.parentNode, switch_instance_anchor);
        } else {
          switch_instance = null;
        }
      } else if (switch_value) {
        switch_instance.$set(switch_instance_changes);
      }
    },
    i(local) {
      if (current)
        return;
      if (switch_instance)
        transition_in(switch_instance.$$.fragment, local);
      current = true;
    },
    o(local) {
      if (switch_instance)
        transition_out(switch_instance.$$.fragment, local);
      current = false;
    },
    d(detaching) {
      if (detaching)
        detach(switch_instance_anchor);
      if (switch_instance)
        destroy_component(switch_instance, detaching);
    }
  };
}
function create_fragment$d(ctx) {
  let current_block_type_index;
  let if_block;
  let if_block_anchor;
  let current;
  const if_block_creators = [create_if_block$b, create_else_block$5];
  const if_blocks = [];
  function select_block_type(ctx2, dirty) {
    if (ctx2[1])
      return 0;
    return 1;
  }
  current_block_type_index = select_block_type(ctx);
  if_block = if_blocks[current_block_type_index] = if_block_creators[current_block_type_index](ctx);
  return {
    c() {
      if_block.c();
      if_block_anchor = empty();
    },
    m(target, anchor) {
      if_blocks[current_block_type_index].m(target, anchor);
      insert(target, if_block_anchor, anchor);
      current = true;
    },
    p(ctx2, [dirty]) {
      let previous_block_index = current_block_type_index;
      current_block_type_index = select_block_type(ctx2);
      if (current_block_type_index === previous_block_index) {
        if_blocks[current_block_type_index].p(ctx2, dirty);
      } else {
        group_outros();
        transition_out(if_blocks[previous_block_index], 1, 1, () => {
          if_blocks[previous_block_index] = null;
        });
        check_outros();
        if_block = if_blocks[current_block_type_index];
        if (!if_block) {
          if_block = if_blocks[current_block_type_index] = if_block_creators[current_block_type_index](ctx2);
          if_block.c();
        } else {
          if_block.p(ctx2, dirty);
        }
        transition_in(if_block, 1);
        if_block.m(if_block_anchor.parentNode, if_block_anchor);
      }
    },
    i(local) {
      if (current)
        return;
      transition_in(if_block);
      current = true;
    },
    o(local) {
      transition_out(if_block);
      current = false;
    },
    d(detaching) {
      if_blocks[current_block_type_index].d(detaching);
      if (detaching)
        detach(if_block_anchor);
    }
  };
}
function getLocation() {
  const hashPosition = window.location.href.indexOf("#/");
  let location2 = hashPosition > -1 ? window.location.href.substr(hashPosition + 1) : "/";
  const qsPosition = location2.indexOf("?");
  let querystring = "";
  if (qsPosition > -1) {
    querystring = location2.substr(qsPosition + 1);
    location2 = location2.substr(0, qsPosition);
  }
  return { location: location2, querystring };
}
const loc = readable(
  null,
  function start2(set) {
    set(getLocation());
    const update2 = () => {
      set(getLocation());
    };
    window.addEventListener("hashchange", update2, false);
    return function stop() {
      window.removeEventListener("hashchange", update2, false);
    };
  }
);
derived(loc, ($loc) => $loc.location);
derived(loc, ($loc) => $loc.querystring);
const params = writable(void 0);
async function push(location2) {
  if (!location2 || location2.length < 1 || location2.charAt(0) != "/" && location2.indexOf("#/") !== 0) {
    throw Error("Invalid parameter location");
  }
  await tick();
  history.replaceState(
    {
      ...history.state,
      __svelte_spa_router_scrollX: window.scrollX,
      __svelte_spa_router_scrollY: window.scrollY
    },
    void 0
  );
  window.location.hash = (location2.charAt(0) == "#" ? "" : "#") + location2;
}
function restoreScroll(state) {
  if (state) {
    window.scrollTo(state.__svelte_spa_router_scrollX, state.__svelte_spa_router_scrollY);
  } else {
    window.scrollTo(0, 0);
  }
}
function instance$d($$self, $$props, $$invalidate) {
  let { routes: routes2 = {} } = $$props;
  let { prefix = "" } = $$props;
  let { restoreScrollState = false } = $$props;
  class RouteItem {
    constructor(path, component2) {
      if (!component2 || typeof component2 != "function" && (typeof component2 != "object" || component2._sveltesparouter !== true)) {
        throw Error("Invalid component object");
      }
      if (!path || typeof path == "string" && (path.length < 1 || path.charAt(0) != "/" && path.charAt(0) != "*") || typeof path == "object" && !(path instanceof RegExp)) {
        throw Error('Invalid value for "path" argument - strings must start with / or *');
      }
      const { pattern, keys } = parse(path);
      this.path = path;
      if (typeof component2 == "object" && component2._sveltesparouter === true) {
        this.component = component2.component;
        this.conditions = component2.conditions || [];
        this.userData = component2.userData;
        this.props = component2.props || {};
      } else {
        this.component = () => Promise.resolve(component2);
        this.conditions = [];
        this.props = {};
      }
      this._pattern = pattern;
      this._keys = keys;
    }
    match(path) {
      if (prefix) {
        if (typeof prefix == "string") {
          if (path.startsWith(prefix)) {
            path = path.substr(prefix.length) || "/";
          } else {
            return null;
          }
        } else if (prefix instanceof RegExp) {
          const match = path.match(prefix);
          if (match && match[0]) {
            path = path.substr(match[0].length) || "/";
          } else {
            return null;
          }
        }
      }
      const matches = this._pattern.exec(path);
      if (matches === null) {
        return null;
      }
      if (this._keys === false) {
        return matches;
      }
      const out = {};
      let i = 0;
      while (i < this._keys.length) {
        try {
          out[this._keys[i]] = decodeURIComponent(matches[i + 1] || "") || null;
        } catch (e) {
          out[this._keys[i]] = null;
        }
        i++;
      }
      return out;
    }
    async checkConditions(detail) {
      for (let i = 0; i < this.conditions.length; i++) {
        if (!await this.conditions[i](detail)) {
          return false;
        }
      }
      return true;
    }
  }
  const routesList = [];
  if (routes2 instanceof Map) {
    routes2.forEach((route, path) => {
      routesList.push(new RouteItem(path, route));
    });
  } else {
    Object.keys(routes2).forEach((path) => {
      routesList.push(new RouteItem(path, routes2[path]));
    });
  }
  let component = null;
  let componentParams = null;
  let props = {};
  const dispatch2 = createEventDispatcher();
  async function dispatchNextTick(name, detail) {
    await tick();
    dispatch2(name, detail);
  }
  let previousScrollState = null;
  let popStateChanged = null;
  if (restoreScrollState) {
    popStateChanged = (event) => {
      if (event.state && (event.state.__svelte_spa_router_scrollY || event.state.__svelte_spa_router_scrollX)) {
        previousScrollState = event.state;
      } else {
        previousScrollState = null;
      }
    };
    window.addEventListener("popstate", popStateChanged);
    afterUpdate(() => {
      restoreScroll(previousScrollState);
    });
  }
  let lastLoc = null;
  let componentObj = null;
  const unsubscribeLoc = loc.subscribe(async (newLoc) => {
    lastLoc = newLoc;
    let i = 0;
    while (i < routesList.length) {
      const match = routesList[i].match(newLoc.location);
      if (!match) {
        i++;
        continue;
      }
      const detail = {
        route: routesList[i].path,
        location: newLoc.location,
        querystring: newLoc.querystring,
        userData: routesList[i].userData,
        params: match && typeof match == "object" && Object.keys(match).length ? match : null
      };
      if (!await routesList[i].checkConditions(detail)) {
        $$invalidate(0, component = null);
        componentObj = null;
        dispatchNextTick("conditionsFailed", detail);
        return;
      }
      dispatchNextTick("routeLoading", Object.assign({}, detail));
      const obj = routesList[i].component;
      if (componentObj != obj) {
        if (obj.loading) {
          $$invalidate(0, component = obj.loading);
          componentObj = obj;
          $$invalidate(1, componentParams = obj.loadingParams);
          $$invalidate(2, props = {});
          dispatchNextTick("routeLoaded", Object.assign({}, detail, {
            component,
            name: component.name,
            params: componentParams
          }));
        } else {
          $$invalidate(0, component = null);
          componentObj = null;
        }
        const loaded = await obj();
        if (newLoc != lastLoc) {
          return;
        }
        $$invalidate(0, component = loaded && loaded.default || loaded);
        componentObj = obj;
      }
      if (match && typeof match == "object" && Object.keys(match).length) {
        $$invalidate(1, componentParams = match);
      } else {
        $$invalidate(1, componentParams = null);
      }
      $$invalidate(2, props = routesList[i].props);
      dispatchNextTick("routeLoaded", Object.assign({}, detail, {
        component,
        name: component.name,
        params: componentParams
      })).then(() => {
        params.set(componentParams);
      });
      return;
    }
    $$invalidate(0, component = null);
    componentObj = null;
    params.set(void 0);
  });
  onDestroy(() => {
    unsubscribeLoc();
    popStateChanged && window.removeEventListener("popstate", popStateChanged);
  });
  function routeEvent_handler(event) {
    bubble.call(this, $$self, event);
  }
  function routeEvent_handler_1(event) {
    bubble.call(this, $$self, event);
  }
  $$self.$$set = ($$props2) => {
    if ("routes" in $$props2)
      $$invalidate(3, routes2 = $$props2.routes);
    if ("prefix" in $$props2)
      $$invalidate(4, prefix = $$props2.prefix);
    if ("restoreScrollState" in $$props2)
      $$invalidate(5, restoreScrollState = $$props2.restoreScrollState);
  };
  $$self.$$.update = () => {
    if ($$self.$$.dirty & 32) {
      history.scrollRestoration = restoreScrollState ? "manual" : "auto";
    }
  };
  return [
    component,
    componentParams,
    props,
    routes2,
    prefix,
    restoreScrollState,
    routeEvent_handler,
    routeEvent_handler_1
  ];
}
class Router extends SvelteComponent {
  constructor(options) {
    super();
    init(this, options, instance$d, create_fragment$d, safe_not_equal, {
      routes: 3,
      prefix: 4,
      restoreScrollState: 5
    });
  }
}
function create_fragment$c(ctx) {
  let current;
  const default_slot_template = ctx[3].default;
  const default_slot = create_slot(default_slot_template, ctx, ctx[2], null);
  return {
    c() {
      if (default_slot)
        default_slot.c();
    },
    m(target, anchor) {
      if (default_slot) {
        default_slot.m(target, anchor);
      }
      current = true;
    },
    p(ctx2, [dirty]) {
      if (default_slot) {
        if (default_slot.p && (!current || dirty & 4)) {
          update_slot_base(
            default_slot,
            default_slot_template,
            ctx2,
            ctx2[2],
            !current ? get_all_dirty_from_scope(ctx2[2]) : get_slot_changes(default_slot_template, ctx2[2], dirty, null),
            null
          );
        }
      }
    },
    i(local) {
      if (current)
        return;
      transition_in(default_slot, local);
      current = true;
    },
    o(local) {
      transition_out(default_slot, local);
      current = false;
    },
    d(detaching) {
      if (default_slot)
        default_slot.d(detaching);
    }
  };
}
const [milliseconds, seconds, minutes, hours] = [writable(0), writable(0), writable(0), writable(0)];
function instance$c($$self, $$props, $$invalidate) {
  let $hours, $$unsubscribe_hours = noop;
  let $minutes, $$unsubscribe_minutes = noop;
  let $seconds, $$unsubscribe_seconds = noop;
  let $milliseconds, $$unsubscribe_milliseconds = noop;
  component_subscribe($$self, hours, ($$value) => $$invalidate(5, $hours = $$value));
  component_subscribe($$self, minutes, ($$value) => $$invalidate(6, $minutes = $$value));
  component_subscribe($$self, seconds, ($$value) => $$invalidate(7, $seconds = $$value));
  component_subscribe($$self, milliseconds, ($$value) => $$invalidate(8, $milliseconds = $$value));
  $$self.$$.on_destroy.push(() => $$unsubscribe_hours());
  $$self.$$.on_destroy.push(() => $$unsubscribe_minutes());
  $$self.$$.on_destroy.push(() => $$unsubscribe_seconds());
  $$self.$$.on_destroy.push(() => $$unsubscribe_milliseconds());
  let { $$slots: slots = {}, $$scope } = $$props;
  setContext("stopwatch", {
    start: () => startStopWatch(),
    stop: () => clearStopWatch()
  });
  let interval;
  function clearStopWatch() {
    clearInterval(interval);
    set_store_value(milliseconds, [$milliseconds, $seconds, $minutes, $hours] = [0, 0, 0, 0], $milliseconds, seconds.set($seconds), minutes.set($minutes), hours.set($hours));
  }
  function startStopWatch() {
    interval = setInterval(
      () => {
        displayTimer();
      },
      1e3
    );
  }
  function displayTimer() {
    set_store_value(milliseconds, $milliseconds += 1e3, $milliseconds);
    if ($milliseconds == 1e3) {
      set_store_value(milliseconds, $milliseconds = 0, $milliseconds);
      set_store_value(seconds, $seconds++, $seconds);
      if ($seconds == 60) {
        set_store_value(seconds, $seconds = 0, $seconds);
        set_store_value(minutes, $minutes++, $minutes);
        if ($minutes == 60) {
          set_store_value(minutes, $minutes = 0, $minutes);
          set_store_value(hours, $hours++, $hours);
        }
      }
    }
  }
  $$self.$$set = ($$props2) => {
    if ("$$scope" in $$props2)
      $$invalidate(2, $$scope = $$props2.$$scope);
  };
  return [clearStopWatch, startStopWatch, $$scope, slots];
}
class Stopwatch_onlycount extends SvelteComponent {
  constructor(options) {
    super();
    init(this, options, instance$c, create_fragment$c, safe_not_equal, { clearStopWatch: 0, startStopWatch: 1 });
  }
  get clearStopWatch() {
    return this.$$.ctx[0];
  }
  get startStopWatch() {
    return this.$$.ctx[1];
  }
}
const current_warehouse = writable(null);
const Config = writable({});
const Locale = writable({});
const miners = writable([]);
const statistics = writable({});
const workers = writable([]);
const playerInfo = writable({});
const isMining = writable(false);
const latest = writable([]);
const totalBTCMined = writable(0);
const powerBillOverdue = writable(false);
const powerBill = writable(0);
const rank = writable(void 0);
const playerBalance = writable(0);
function formatDate(time) {
  const config = get_store_value(Config);
  return new Date(time).toLocaleDateString(
    config.DateLocale.locale,
    config.DateLocale.options
  );
}
function currency(amount) {
  const config = get_store_value(Config);
  return new Intl.NumberFormat(config.CurrencyLocale.locale, {
    style: "currency",
    currency: config.CurrencyLocale.currency
  }).format(amount);
}
async function messageHandler(event) {
  try {
    let resp = await event.data;
    let data = resp.data;
    switch (resp.action) {
      case "open":
        menu.set(data.menu);
        if (!data.meta.hasOwner) {
        } else if (data.meta.canEnter) {
        } else {
        }
        break;
      case "Entrance":
        rank.set(data.meta.rank);
        menu.set("entrance");
        current_warehouse.set(data.meta.warehouse);
        data.meta.hasOwner ? push("/") : push("/buy");
        break;
      case "Exit":
        menu.set("entrance");
        push("/exit");
        break;
      case "Computer":
        menu.set("computer");
        push("/");
        isMining.set(data.active);
        miners.set(data.miners);
        statistics.set(data.statistics);
        break;
      case "closeall":
        menu.set(void 0);
        break;
      case "BillOverdue":
        powerBill.set(data.powerbill);
        powerBillOverdue.set(true);
        break;
      case "GetBills":
        getPowerBill();
        break;
      case "RegisterBlockMined":
        UpdateBlocksAndMiners(data.newblock, data.totalbtcmined, data.miners);
        break;
    }
  } catch (e) {
    console.log("We got some bugs: " + e);
  }
}
function keypressHandler(event) {
  if (event.key == "Escape") {
    Nui.send("close");
    menu.set(void 0);
  }
}
function getPowerBill() {
  Nui.send("GetBills").then((resp) => resp.json()).then((resp) => {
    powerBillOverdue.set(resp.overdue);
    powerBill.set(resp.powerbill);
    if (get_store_value(powerBillOverdue))
      isMining.set(false);
  }).catch((e) => console.log("error getting energy bills", e));
}
function UpdateBlocksAndMiners(newBlock, totalbtcmined, miners_info) {
  miners.set(miners_info);
  totalBTCMined.set(totalbtcmined);
  newBlock.id = newBlock.id;
  let _latest = get_store_value(latest);
  if (_latest.length > 3) {
    _latest.shift();
    latest.set([..._latest, newBlock]);
  } else {
    latest.set([..._latest, newBlock]);
  }
}
async function WarehouseData() {
  if (get_store_value(menu) === "computer") {
    const result = await Nui.send("GetComputerData");
    const data = await result.json();
    miners.set(data.miners);
    statistics.set(data.statistics);
    workers.set(data.workers);
    playerInfo.set(data.playerInfo);
    playerBalance.set(data.playerInfo.balance);
    isMining.set(data.active);
  }
}
function onlineMiners() {
  let onlineM = 0;
  get_store_value(miners).forEach((m) => {
    if (m.status)
      onlineM++;
  });
  return onlineM;
}
function create_fragment$b(ctx) {
  let main;
  let div0;
  let h1;
  let t0_value = ctx[1]["BuyWarehouse"] + "";
  let t0;
  let t1;
  let t2;
  let t3;
  let div1;
  let p;
  let t4_value = ctx[1]["WarehouseCost"] + "";
  let t4;
  let t5;
  let span;
  let t7;
  let button;
  let t8_value = ctx[1]["Buy"] + "";
  let t8;
  let mounted;
  let dispose;
  return {
    c() {
      main = element("main");
      div0 = element("div");
      h1 = element("h1");
      t0 = text(t0_value);
      t1 = space();
      t2 = text(ctx[0]);
      t3 = space();
      div1 = element("div");
      p = element("p");
      t4 = text(t4_value);
      t5 = text(":\r\n      ");
      span = element("span");
      span.textContent = `${currency(ctx[2])}`;
      t7 = space();
      button = element("button");
      t8 = text(t8_value);
      attr(h1, "class", "font-bold text-3xl text-primary");
      attr(div0, "class", "w-full flex flex-col p-5 bg-base-300 text-center");
      attr(span, "class", "text-primary");
      attr(p, "class", "text-xl font-bold");
      attr(button, "class", "btn btn-primary my-5 w-full");
      attr(div1, "class", "p-5");
      attr(main, "class", "h-fit w-fit flex flex-col items-center justify-start");
    },
    m(target, anchor) {
      insert(target, main, anchor);
      append(main, div0);
      append(div0, h1);
      append(h1, t0);
      append(h1, t1);
      append(h1, t2);
      append(main, t3);
      append(main, div1);
      append(div1, p);
      append(p, t4);
      append(p, t5);
      append(p, span);
      append(div1, t7);
      append(div1, button);
      append(button, t8);
      if (!mounted) {
        dispose = listen(button, "click", ctx[3]);
        mounted = true;
      }
    },
    p(ctx2, [dirty]) {
      if (dirty & 2 && t0_value !== (t0_value = ctx2[1]["BuyWarehouse"] + ""))
        set_data(t0, t0_value);
      if (dirty & 1)
        set_data(t2, ctx2[0]);
      if (dirty & 2 && t4_value !== (t4_value = ctx2[1]["WarehouseCost"] + ""))
        set_data(t4, t4_value);
      if (dirty & 2 && t8_value !== (t8_value = ctx2[1]["Buy"] + ""))
        set_data(t8, t8_value);
    },
    i: noop,
    o: noop,
    d(detaching) {
      if (detaching)
        detach(main);
      mounted = false;
      dispose();
    }
  };
}
function instance$b($$self, $$props, $$invalidate) {
  var _a;
  let $menu;
  let $rank;
  let $current_warehouse;
  let $Config;
  let $Locale;
  component_subscribe($$self, menu, ($$value) => $$invalidate(4, $menu = $$value));
  component_subscribe($$self, rank, ($$value) => $$invalidate(5, $rank = $$value));
  component_subscribe($$self, current_warehouse, ($$value) => $$invalidate(0, $current_warehouse = $$value));
  component_subscribe($$self, Config, ($$value) => $$invalidate(6, $Config = $$value));
  component_subscribe($$self, Locale, ($$value) => $$invalidate(1, $Locale = $$value));
  let price = (_a = $Config.Warehouses[$current_warehouse - 1]) == null ? void 0 : _a.price;
  async function buy() {
    Nui.send("buywarehouse", { warehouse: $current_warehouse });
    set_store_value(rank, $rank = "owner", $rank);
    set_store_value(menu, $menu = void 0, $menu);
  }
  return [$current_warehouse, $Locale, price, buy];
}
class Buy extends SvelteComponent {
  constructor(options) {
    super();
    init(this, options, instance$b, create_fragment$b, safe_not_equal, {});
  }
}
const home_svelte_svelte_type_style_lang = "";
function get_each_context$6(ctx, list, i) {
  const child_ctx = ctx.slice();
  child_ctx[10] = list[i];
  child_ctx[12] = i;
  return child_ctx;
}
function create_if_block_3$3(ctx) {
  let p;
  let t0_value = ctx[2]["MinersOnline"] + "";
  let t0;
  let t1;
  let t2_value = onlineMiners() + "";
  let t2;
  return {
    c() {
      p = element("p");
      t0 = text(t0_value);
      t1 = space();
      t2 = text(t2_value);
      attr(p, "class", "text-lg");
    },
    m(target, anchor) {
      insert(target, p, anchor);
      append(p, t0);
      append(p, t1);
      append(p, t2);
    },
    p(ctx2, dirty) {
      if (dirty & 4 && t0_value !== (t0_value = ctx2[2]["MinersOnline"] + ""))
        set_data(t0, t0_value);
    },
    d(detaching) {
      if (detaching)
        detach(p);
    }
  };
}
function create_if_block_1$6(ctx) {
  let section;
  let h3;
  let t0_value = ctx[2]["LookingForBlocks"] + "";
  let t0;
  let t1;
  let span;
  let t2;
  let if_block = ctx[3].length >= 1 && create_if_block_2$5(ctx);
  return {
    c() {
      section = element("section");
      h3 = element("h3");
      t0 = text(t0_value);
      t1 = space();
      span = element("span");
      t2 = space();
      if (if_block)
        if_block.c();
      attr(h3, "class", "text-2xl font-bold");
      attr(span, "class", "loader svelte-i5vcf2");
      attr(section, "class", "grid place-items-center gap-2 bg-base-300 rounded-box content-center");
    },
    m(target, anchor) {
      insert(target, section, anchor);
      append(section, h3);
      append(h3, t0);
      append(section, t1);
      append(section, span);
      append(section, t2);
      if (if_block)
        if_block.m(section, null);
    },
    p(ctx2, dirty) {
      if (dirty & 4 && t0_value !== (t0_value = ctx2[2]["LookingForBlocks"] + ""))
        set_data(t0, t0_value);
      if (ctx2[3].length >= 1) {
        if (if_block) {
          if_block.p(ctx2, dirty);
        } else {
          if_block = create_if_block_2$5(ctx2);
          if_block.c();
          if_block.m(section, null);
        }
      } else if (if_block) {
        if_block.d(1);
        if_block = null;
      }
    },
    d(detaching) {
      if (detaching)
        detach(section);
      if (if_block)
        if_block.d();
    }
  };
}
function create_if_block_2$5(ctx) {
  let p0;
  let t0_value = ctx[2]["LatestBlockMined"] + "";
  let t0;
  let t1;
  let t2_value = ctx[3][ctx[3].length - 1].id + "";
  let t2;
  let t3;
  let p1;
  let t4_value = ctx[2]["Reward"] + "";
  let t4;
  let t5;
  let t6_value = new Intl.NumberFormat("en-IN", { maximumFractionDigits: 5 }).format(Number(ctx[3][ctx[3].length - 1].reward)) + "";
  let t6;
  let t7;
  return {
    c() {
      p0 = element("p");
      t0 = text(t0_value);
      t1 = space();
      t2 = text(t2_value);
      t3 = space();
      p1 = element("p");
      t4 = text(t4_value);
      t5 = space();
      t6 = text(t6_value);
      t7 = text(" BTC");
      attr(p0, "class", "font-bold");
      attr(p1, "class", "font-bold");
    },
    m(target, anchor) {
      insert(target, p0, anchor);
      append(p0, t0);
      append(p0, t1);
      append(p0, t2);
      insert(target, t3, anchor);
      insert(target, p1, anchor);
      append(p1, t4);
      append(p1, t5);
      append(p1, t6);
      append(p1, t7);
    },
    p(ctx2, dirty) {
      if (dirty & 4 && t0_value !== (t0_value = ctx2[2]["LatestBlockMined"] + ""))
        set_data(t0, t0_value);
      if (dirty & 8 && t2_value !== (t2_value = ctx2[3][ctx2[3].length - 1].id + ""))
        set_data(t2, t2_value);
      if (dirty & 4 && t4_value !== (t4_value = ctx2[2]["Reward"] + ""))
        set_data(t4, t4_value);
      if (dirty & 8 && t6_value !== (t6_value = new Intl.NumberFormat("en-IN", { maximumFractionDigits: 5 }).format(Number(ctx2[3][ctx2[3].length - 1].reward)) + ""))
        set_data(t6, t6_value);
    },
    d(detaching) {
      if (detaching)
        detach(p0);
      if (detaching)
        detach(t3);
      if (detaching)
        detach(p1);
    }
  };
}
function create_if_block$a(ctx) {
  let h3;
  let t0_value = ctx[2]["LatestBlockRewards"] + "";
  let t0;
  let t1;
  let div;
  let div_intro;
  let each_value = ctx[4].mining.latest;
  let each_blocks = [];
  for (let i = 0; i < each_value.length; i += 1) {
    each_blocks[i] = create_each_block$6(get_each_context$6(ctx, each_value, i));
  }
  return {
    c() {
      h3 = element("h3");
      t0 = text(t0_value);
      t1 = space();
      div = element("div");
      for (let i = 0; i < each_blocks.length; i += 1) {
        each_blocks[i].c();
      }
      attr(h3, "class", "text-2xl font-bold");
      attr(div, "class", "flex gap-2 items-center w-full overflow-hidden");
    },
    m(target, anchor) {
      insert(target, h3, anchor);
      append(h3, t0);
      insert(target, t1, anchor);
      insert(target, div, anchor);
      for (let i = 0; i < each_blocks.length; i += 1) {
        each_blocks[i].m(div, null);
      }
    },
    p(ctx2, dirty) {
      if (dirty & 4 && t0_value !== (t0_value = ctx2[2]["LatestBlockRewards"] + ""))
        set_data(t0, t0_value);
      if (dirty & 20) {
        each_value = ctx2[4].mining.latest;
        let i;
        for (i = 0; i < each_value.length; i += 1) {
          const child_ctx = get_each_context$6(ctx2, each_value, i);
          if (each_blocks[i]) {
            each_blocks[i].p(child_ctx, dirty);
          } else {
            each_blocks[i] = create_each_block$6(child_ctx);
            each_blocks[i].c();
            each_blocks[i].m(div, null);
          }
        }
        for (; i < each_blocks.length; i += 1) {
          each_blocks[i].d(1);
        }
        each_blocks.length = each_value.length;
      }
    },
    i(local) {
      if (!div_intro) {
        add_render_callback(() => {
          div_intro = create_in_transition(div, fade, {});
          div_intro.start();
        });
      }
    },
    o: noop,
    d(detaching) {
      if (detaching)
        detach(h3);
      if (detaching)
        detach(t1);
      if (detaching)
        detach(div);
      destroy_each(each_blocks, detaching);
    }
  };
}
function create_each_block$6(ctx) {
  let div2;
  let div1;
  let p0;
  let t0_value = ctx[2]["Block"] + "";
  let t0;
  let t1;
  let t2_value = ctx[10].id + "";
  let t2;
  let t3;
  let div0;
  let p1;
  let t4_value = ctx[2]["Reward"] + "";
  let t4;
  let t5;
  let t6_value = new Intl.NumberFormat("en-IN", { maximumFractionDigits: 5 }).format(ctx[10].reward) + "";
  let t6;
  let t7;
  let t8;
  let p2;
  let t9_value = ctx[2]["MiningDate"] + "";
  let t9;
  let t10;
  let t11_value = formatDate(ctx[10].time) + "";
  let t11;
  let t12;
  return {
    c() {
      div2 = element("div");
      div1 = element("div");
      p0 = element("p");
      t0 = text(t0_value);
      t1 = space();
      t2 = text(t2_value);
      t3 = space();
      div0 = element("div");
      p1 = element("p");
      t4 = text(t4_value);
      t5 = space();
      t6 = text(t6_value);
      t7 = text(" BTC");
      t8 = space();
      p2 = element("p");
      t9 = text(t9_value);
      t10 = space();
      t11 = text(t11_value);
      t12 = space();
      attr(p0, "class", "text-xl font-bold");
      attr(div1, "class", "card-body text-white");
      attr(div2, "class", "flex-grow text-black card " + (ctx[12] % 2 == 0 ? "luxugradtwo" : "luxugrad") + " svelte-i5vcf2");
    },
    m(target, anchor) {
      insert(target, div2, anchor);
      append(div2, div1);
      append(div1, p0);
      append(p0, t0);
      append(p0, t1);
      append(p0, t2);
      append(div1, t3);
      append(div1, div0);
      append(div0, p1);
      append(p1, t4);
      append(p1, t5);
      append(p1, t6);
      append(p1, t7);
      append(div0, t8);
      append(div0, p2);
      append(p2, t9);
      append(p2, t10);
      append(p2, t11);
      append(div2, t12);
    },
    p(ctx2, dirty) {
      if (dirty & 4 && t0_value !== (t0_value = ctx2[2]["Block"] + ""))
        set_data(t0, t0_value);
      if (dirty & 16 && t2_value !== (t2_value = ctx2[10].id + ""))
        set_data(t2, t2_value);
      if (dirty & 4 && t4_value !== (t4_value = ctx2[2]["Reward"] + ""))
        set_data(t4, t4_value);
      if (dirty & 16 && t6_value !== (t6_value = new Intl.NumberFormat("en-IN", { maximumFractionDigits: 5 }).format(ctx2[10].reward) + ""))
        set_data(t6, t6_value);
      if (dirty & 4 && t9_value !== (t9_value = ctx2[2]["MiningDate"] + ""))
        set_data(t9, t9_value);
      if (dirty & 16 && t11_value !== (t11_value = formatDate(ctx2[10].time) + ""))
        set_data(t11, t11_value);
    },
    d(detaching) {
      if (detaching)
        detach(div2);
    }
  };
}
function create_fragment$a(ctx) {
  let main;
  let section0;
  let h30;
  let t0_value = ctx[2]["MiningStatus"] + "";
  let t0;
  let t1;
  let button;
  let t2_value = (ctx[1] ? ctx[2]["Online"] : ctx[2]["Offline"]) + "";
  let t2;
  let button_class_value;
  let t3;
  let t4;
  let t5;
  let section1;
  let main_intro;
  let t6;
  let input;
  let t7;
  let div1;
  let div0;
  let label;
  let t9;
  let h31;
  let t10_value = ctx[2]["NoMinersOnline"] + "";
  let t10;
  let t11;
  let p;
  let t12_value = ctx[2]["ToStartMiningYouNeed"] + "";
  let t12;
  let mounted;
  let dispose;
  let if_block0 = ctx[1] && create_if_block_3$3(ctx);
  let if_block1 = ctx[1] && create_if_block_1$6(ctx);
  let if_block2 = ctx[4].mining.latest && ctx[4].mining.latest.length > 0 && create_if_block$a(ctx);
  return {
    c() {
      main = element("main");
      section0 = element("section");
      h30 = element("h3");
      t0 = text(t0_value);
      t1 = space();
      button = element("button");
      t2 = text(t2_value);
      t3 = space();
      if (if_block0)
        if_block0.c();
      t4 = space();
      if (if_block1)
        if_block1.c();
      t5 = space();
      section1 = element("section");
      if (if_block2)
        if_block2.c();
      t6 = space();
      input = element("input");
      t7 = space();
      div1 = element("div");
      div0 = element("div");
      label = element("label");
      label.textContent = "\u2715";
      t9 = space();
      h31 = element("h3");
      t10 = text(t10_value);
      t11 = space();
      p = element("p");
      t12 = text(t12_value);
      attr(h30, "class", "text-2xl font-bold");
      attr(button, "class", button_class_value = "btn border-none w-32 text-white font-bold " + (ctx[1] ? "bg-green-500 hover:bg-green-600" : "bg-red-500 hover:bg-red-600"));
      attr(section0, "class", "grid place-items-center gap-3 bg-base-300 rounded-box content-center svelte-i5vcf2");
      toggle_class(section0, "twocol", !ctx[1]);
      attr(section1, "class", "grid place-items-center twocol content-start gap-4 svelte-i5vcf2");
      attr(main, "class", "layout gap-5 p-8 svelte-i5vcf2");
      attr(input, "type", "checkbox");
      attr(input, "id", "my-modal-3");
      attr(input, "class", "modal-toggle");
      attr(label, "for", "my-modal-3");
      attr(label, "class", "btn btn-sm btn-circle absolute right-2 top-2");
      attr(h31, "class", "text-lg font-bold");
      attr(p, "class", "py-4");
      attr(div0, "class", "modal-box relative");
      attr(div1, "class", "modal");
    },
    m(target, anchor) {
      insert(target, main, anchor);
      append(main, section0);
      append(section0, h30);
      append(h30, t0);
      append(section0, t1);
      append(section0, button);
      append(button, t2);
      append(section0, t3);
      if (if_block0)
        if_block0.m(section0, null);
      append(main, t4);
      if (if_block1)
        if_block1.m(main, null);
      append(main, t5);
      append(main, section1);
      if (if_block2)
        if_block2.m(section1, null);
      insert(target, t6, anchor);
      insert(target, input, anchor);
      ctx[6](input);
      insert(target, t7, anchor);
      insert(target, div1, anchor);
      append(div1, div0);
      append(div0, label);
      append(div0, t9);
      append(div0, h31);
      append(h31, t10);
      append(div0, t11);
      append(div0, p);
      append(p, t12);
      if (!mounted) {
        dispose = listen(button, "click", ctx[5]);
        mounted = true;
      }
    },
    p(ctx2, [dirty]) {
      if (dirty & 4 && t0_value !== (t0_value = ctx2[2]["MiningStatus"] + ""))
        set_data(t0, t0_value);
      if (dirty & 6 && t2_value !== (t2_value = (ctx2[1] ? ctx2[2]["Online"] : ctx2[2]["Offline"]) + ""))
        set_data(t2, t2_value);
      if (dirty & 2 && button_class_value !== (button_class_value = "btn border-none w-32 text-white font-bold " + (ctx2[1] ? "bg-green-500 hover:bg-green-600" : "bg-red-500 hover:bg-red-600"))) {
        attr(button, "class", button_class_value);
      }
      if (ctx2[1]) {
        if (if_block0) {
          if_block0.p(ctx2, dirty);
        } else {
          if_block0 = create_if_block_3$3(ctx2);
          if_block0.c();
          if_block0.m(section0, null);
        }
      } else if (if_block0) {
        if_block0.d(1);
        if_block0 = null;
      }
      if (dirty & 2) {
        toggle_class(section0, "twocol", !ctx2[1]);
      }
      if (ctx2[1]) {
        if (if_block1) {
          if_block1.p(ctx2, dirty);
        } else {
          if_block1 = create_if_block_1$6(ctx2);
          if_block1.c();
          if_block1.m(main, t5);
        }
      } else if (if_block1) {
        if_block1.d(1);
        if_block1 = null;
      }
      if (ctx2[4].mining.latest && ctx2[4].mining.latest.length > 0) {
        if (if_block2) {
          if_block2.p(ctx2, dirty);
          if (dirty & 16) {
            transition_in(if_block2, 1);
          }
        } else {
          if_block2 = create_if_block$a(ctx2);
          if_block2.c();
          transition_in(if_block2, 1);
          if_block2.m(section1, null);
        }
      } else if (if_block2) {
        if_block2.d(1);
        if_block2 = null;
      }
      if (dirty & 4 && t10_value !== (t10_value = ctx2[2]["NoMinersOnline"] + ""))
        set_data(t10, t10_value);
      if (dirty & 4 && t12_value !== (t12_value = ctx2[2]["ToStartMiningYouNeed"] + ""))
        set_data(t12, t12_value);
    },
    i(local) {
      transition_in(if_block2);
      if (!main_intro) {
        add_render_callback(() => {
          main_intro = create_in_transition(main, fade, {});
          main_intro.start();
        });
      }
    },
    o: noop,
    d(detaching) {
      if (detaching)
        detach(main);
      if (if_block0)
        if_block0.d();
      if (if_block1)
        if_block1.d();
      if (if_block2)
        if_block2.d();
      if (detaching)
        detach(t6);
      if (detaching)
        detach(input);
      ctx[6](null);
      if (detaching)
        detach(t7);
      if (detaching)
        detach(div1);
      mounted = false;
      dispose();
    }
  };
}
function instance$a($$self, $$props, $$invalidate) {
  let $isMining;
  let $Locale;
  let $latest;
  let $statistics;
  component_subscribe($$self, isMining, ($$value) => $$invalidate(1, $isMining = $$value));
  component_subscribe($$self, Locale, ($$value) => $$invalidate(2, $Locale = $$value));
  component_subscribe($$self, latest, ($$value) => $$invalidate(3, $latest = $$value));
  component_subscribe($$self, statistics, ($$value) => $$invalidate(4, $statistics = $$value));
  let OnlineMinersModal;
  let stopwatchFuncs = getContext("stopwatch");
  let { start: start3, stop } = stopwatchFuncs;
  async function toggleMining() {
    if (onlineMiners() === 0) {
      $$invalidate(0, OnlineMinersModal.checked = true, OnlineMinersModal);
      return;
    }
    const result = await Nui.send("togglemining");
    const data = await result.json();
    if (data) {
      set_store_value(isMining, $isMining = true, $isMining);
      start3();
    } else {
      set_store_value(isMining, $isMining = false, $isMining);
      stop();
    }
  }
  WarehouseData();
  onMount(() => {
    themeChange.exports.themeChange(false);
  });
  function input_binding($$value) {
    binding_callbacks[$$value ? "unshift" : "push"](() => {
      OnlineMinersModal = $$value;
      $$invalidate(0, OnlineMinersModal);
    });
  }
  return [
    OnlineMinersModal,
    $isMining,
    $Locale,
    $latest,
    $statistics,
    toggleMining,
    input_binding
  ];
}
class Home extends SvelteComponent {
  constructor(options) {
    super();
    init(this, options, instance$a, create_fragment$a, safe_not_equal, {});
  }
}
const stats_svelte_svelte_type_style_lang = "";
function get_each_context$5(ctx, list, i) {
  const child_ctx = ctx.slice();
  child_ctx[7] = list[i];
  child_ctx[10] = i;
  const constants_0 = child_ctx[1].MinerSettings[child_ctx[7].type];
  child_ctx[8] = constants_0;
  return child_ctx;
}
function create_if_block$9(ctx) {
  let p;
  let t0_value = ctx[3]["MinerStatus"] + "";
  let t0;
  let t1;
  let table;
  let thead;
  let th0;
  let t3;
  let th1;
  let t5;
  let th2;
  let t6_value = ctx[3]["Health"] + "";
  let t6;
  let t7;
  let th3;
  let t8_value = ctx[3]["MaxHealth"] + "";
  let t8;
  let t9;
  let th4;
  let t10_value = ctx[3]["PowerUsage"] + "";
  let t10;
  let t11;
  let th5;
  let t12_value = ctx[3]["Temperature"] + "";
  let t12;
  let t13;
  let th6;
  let t14_value = ctx[3]["Status"] + "";
  let t14;
  let t15;
  let tbody;
  let each_blocks = [];
  let each_1_lookup = /* @__PURE__ */ new Map();
  let each_value = ctx[2];
  const get_key = (ctx2) => ctx2[7].id;
  for (let i = 0; i < each_value.length; i += 1) {
    let child_ctx = get_each_context$5(ctx, each_value, i);
    let key = get_key(child_ctx);
    each_1_lookup.set(key, each_blocks[i] = create_each_block$5(key, child_ctx));
  }
  return {
    c() {
      p = element("p");
      t0 = text(t0_value);
      t1 = space();
      table = element("table");
      thead = element("thead");
      th0 = element("th");
      th0.textContent = "ID";
      t3 = space();
      th1 = element("th");
      th1.textContent = "Hash Rate";
      t5 = space();
      th2 = element("th");
      t6 = text(t6_value);
      t7 = space();
      th3 = element("th");
      t8 = text(t8_value);
      t9 = space();
      th4 = element("th");
      t10 = text(t10_value);
      t11 = space();
      th5 = element("th");
      t12 = text(t12_value);
      t13 = space();
      th6 = element("th");
      t14 = text(t14_value);
      t15 = space();
      tbody = element("tbody");
      for (let i = 0; i < each_blocks.length; i += 1) {
        each_blocks[i].c();
      }
      attr(p, "class", "text-2xl my-2 text-center");
      attr(th0, "class", "svelte-196ruwv");
      attr(th1, "class", "svelte-196ruwv");
      attr(th2, "class", "svelte-196ruwv");
      attr(th3, "class", "svelte-196ruwv");
      attr(th4, "class", "svelte-196ruwv");
      attr(th5, "class", "svelte-196ruwv");
      attr(th6, "class", "svelte-196ruwv");
      attr(table, "class", "text-center");
    },
    m(target, anchor) {
      insert(target, p, anchor);
      append(p, t0);
      insert(target, t1, anchor);
      insert(target, table, anchor);
      append(table, thead);
      append(thead, th0);
      append(thead, t3);
      append(thead, th1);
      append(thead, t5);
      append(thead, th2);
      append(th2, t6);
      append(thead, t7);
      append(thead, th3);
      append(th3, t8);
      append(thead, t9);
      append(thead, th4);
      append(th4, t10);
      append(thead, t11);
      append(thead, th5);
      append(th5, t12);
      append(thead, t13);
      append(thead, th6);
      append(th6, t14);
      append(table, t15);
      append(table, tbody);
      for (let i = 0; i < each_blocks.length; i += 1) {
        each_blocks[i].m(tbody, null);
      }
    },
    p(ctx2, dirty) {
      if (dirty & 8 && t0_value !== (t0_value = ctx2[3]["MinerStatus"] + ""))
        set_data(t0, t0_value);
      if (dirty & 8 && t6_value !== (t6_value = ctx2[3]["Health"] + ""))
        set_data(t6, t6_value);
      if (dirty & 8 && t8_value !== (t8_value = ctx2[3]["MaxHealth"] + ""))
        set_data(t8, t8_value);
      if (dirty & 8 && t10_value !== (t10_value = ctx2[3]["PowerUsage"] + ""))
        set_data(t10, t10_value);
      if (dirty & 8 && t12_value !== (t12_value = ctx2[3]["Temperature"] + ""))
        set_data(t12, t12_value);
      if (dirty & 8 && t14_value !== (t14_value = ctx2[3]["Status"] + ""))
        set_data(t14, t14_value);
      if (dirty & 6) {
        each_value = ctx2[2];
        each_blocks = update_keyed_each(each_blocks, dirty, get_key, 1, ctx2, each_value, each_1_lookup, tbody, destroy_block, create_each_block$5, null, get_each_context$5);
      }
    },
    d(detaching) {
      if (detaching)
        detach(p);
      if (detaching)
        detach(t1);
      if (detaching)
        detach(table);
      for (let i = 0; i < each_blocks.length; i += 1) {
        each_blocks[i].d();
      }
    }
  };
}
function create_each_block$5(key_1, ctx) {
  let tr;
  let td0;
  let t0_value = ctx[10] + 1 + "";
  let t0;
  let t1;
  let td1;
  let t2_value = ctx[7].status ? `${(ctx[7].overclock * ctx[8].data.hashrate).toFixed(2)} TH/s` : "N/A";
  let t2;
  let t3;
  let td2;
  let t4_value = Math.round(ctx[7].health) + "";
  let t4;
  let t5;
  let td3;
  let t6_value = ctx[8].health + "";
  let t6;
  let t7;
  let td4;
  let t8_value = ctx[7].status ? `${new Intl.NumberFormat("en-IN", { maximumSignificantDigits: 4 }).format(ctx[8].data.power * ctx[7].overclock)} kW` : "N/A";
  let t8;
  let t9;
  let td5;
  let t10_value = ctx[7].status ? `${(ctx[8].data.temps * (ctx[7].overclock / 1.5)).toFixed(1)} \xBAC` : "N/A";
  let t10;
  let t11;
  let td6;
  let span;
  let t12_value = ctx[7].status ? "\u{1F7E2}" : "\u{1F534}";
  let t12;
  let span_class_value;
  let t13;
  return {
    key: key_1,
    first: null,
    c() {
      tr = element("tr");
      td0 = element("td");
      t0 = text(t0_value);
      t1 = space();
      td1 = element("td");
      t2 = text(t2_value);
      t3 = space();
      td2 = element("td");
      t4 = text(t4_value);
      t5 = space();
      td3 = element("td");
      t6 = text(t6_value);
      t7 = space();
      td4 = element("td");
      t8 = text(t8_value);
      t9 = space();
      td5 = element("td");
      t10 = text(t10_value);
      t11 = space();
      td6 = element("td");
      span = element("span");
      t12 = text(t12_value);
      t13 = space();
      attr(td0, "class", "svelte-196ruwv");
      attr(td1, "class", "svelte-196ruwv");
      attr(td2, "class", "svelte-196ruwv");
      attr(td3, "class", "svelte-196ruwv");
      attr(td4, "class", "svelte-196ruwv");
      attr(td5, "class", "svelte-196ruwv");
      attr(span, "class", span_class_value = ctx[7].status ? "text-green-500" : "text-red-500");
      attr(td6, "class", "svelte-196ruwv");
      attr(tr, "class", "svelte-196ruwv");
      this.first = tr;
    },
    m(target, anchor) {
      insert(target, tr, anchor);
      append(tr, td0);
      append(td0, t0);
      append(tr, t1);
      append(tr, td1);
      append(td1, t2);
      append(tr, t3);
      append(tr, td2);
      append(td2, t4);
      append(tr, t5);
      append(tr, td3);
      append(td3, t6);
      append(tr, t7);
      append(tr, td4);
      append(td4, t8);
      append(tr, t9);
      append(tr, td5);
      append(td5, t10);
      append(tr, t11);
      append(tr, td6);
      append(td6, span);
      append(span, t12);
      append(tr, t13);
    },
    p(new_ctx, dirty) {
      ctx = new_ctx;
      if (dirty & 4 && t0_value !== (t0_value = ctx[10] + 1 + ""))
        set_data(t0, t0_value);
      if (dirty & 6 && t2_value !== (t2_value = ctx[7].status ? `${(ctx[7].overclock * ctx[8].data.hashrate).toFixed(2)} TH/s` : "N/A"))
        set_data(t2, t2_value);
      if (dirty & 4 && t4_value !== (t4_value = Math.round(ctx[7].health) + ""))
        set_data(t4, t4_value);
      if (dirty & 6 && t6_value !== (t6_value = ctx[8].health + ""))
        set_data(t6, t6_value);
      if (dirty & 6 && t8_value !== (t8_value = ctx[7].status ? `${new Intl.NumberFormat("en-IN", { maximumSignificantDigits: 4 }).format(ctx[8].data.power * ctx[7].overclock)} kW` : "N/A"))
        set_data(t8, t8_value);
      if (dirty & 6 && t10_value !== (t10_value = ctx[7].status ? `${(ctx[8].data.temps * (ctx[7].overclock / 1.5)).toFixed(1)} \xBAC` : "N/A"))
        set_data(t10, t10_value);
      if (dirty & 4 && t12_value !== (t12_value = ctx[7].status ? "\u{1F7E2}" : "\u{1F534}"))
        set_data(t12, t12_value);
      if (dirty & 4 && span_class_value !== (span_class_value = ctx[7].status ? "text-green-500" : "text-red-500")) {
        attr(span, "class", span_class_value);
      }
    },
    d(detaching) {
      if (detaching)
        detach(tr);
    }
  };
}
function create_fragment$9(ctx) {
  let main;
  let p0;
  let t1;
  let div17;
  let div16;
  let div15;
  let div2;
  let div0;
  let t2_value = ctx[3]["GeneralStatistics"] + "";
  let t2;
  let t3;
  let div1;
  let t4_value = ctx[2].length + "";
  let t4;
  let t5;
  let div6;
  let div3;
  let t7;
  let div4;
  let t8_value = ctx[3]["MinersOnline"] + "";
  let t8;
  let t9;
  let div5;
  let t10_value = onlineMiners() + "";
  let t10;
  let t11;
  let div10;
  let div7;
  let t12;
  let div8;
  let t13_value = ctx[3]["BitcoinMined"] + "";
  let t13;
  let t14;
  let div9;
  let t15_value = new Intl.NumberFormat("en-IN", { maximumSignificantDigits: 5 }).format(ctx[4].mining.total) + "";
  let t15;
  let t16;
  let div14;
  let div11;
  let t18;
  let div12;
  let t19_value = ctx[3]["TotalPowerConsumption"] + "";
  let t19;
  let t20;
  let div13;
  let t23;
  let div19;
  let p1;
  let t25;
  let div18;
  let img;
  let img_src_value;
  let t26;
  let span0;
  let t28;
  let span1;
  let t29_value = new Intl.NumberFormat("en-IN", { maximumFractionDigits: 5 }).format(ctx[0]) + "";
  let t29;
  let t30;
  let button;
  let t31_value = ctx[3]["Withdraw"] + "";
  let t31;
  let t32;
  let main_intro;
  let mounted;
  let dispose;
  let if_block = ctx[2].length > 0 && create_if_block$9(ctx);
  return {
    c() {
      main = element("main");
      p0 = element("p");
      p0.textContent = "General Statistics";
      t1 = space();
      div17 = element("div");
      div16 = element("div");
      div15 = element("div");
      div2 = element("div");
      div0 = element("div");
      t2 = text(t2_value);
      t3 = space();
      div1 = element("div");
      t4 = text(t4_value);
      t5 = space();
      div6 = element("div");
      div3 = element("div");
      div3.textContent = `${onlineMiners() > 0 ? "\u{1F7E2}" : "\u{1F534}"}`;
      t7 = space();
      div4 = element("div");
      t8 = text(t8_value);
      t9 = space();
      div5 = element("div");
      t10 = text(t10_value);
      t11 = space();
      div10 = element("div");
      div7 = element("div");
      div7.innerHTML = `<svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" id="body_1" width="45" height="45"><g transform="matrix(0.703125 0 0 0.703125 0 0)"><g transform="matrix(1 0 0 1 0.00630876 -0.00301984)"><path d="M63.033 39.744C 58.759003 56.887 41.396004 67.32 24.251 63.045C 7.112999 58.770996 -3.3199997 41.406998 0.9559994 24.265C 5.227999 7.119999 22.591 -3.314001 39.731003 0.9599991C 56.875 5.2339993 67.30701 22.599998 63.033005 39.744L63.033005 39.744L63.033 39.744z" stroke="none" fill="#F7931A" fill-rule="nonzero"></path><path d="M46.103 27.444C 46.74 23.186 43.498 20.897 39.065002 19.369999L39.065002 19.369999L40.503002 13.601999L36.992 12.726999L35.592 18.342999C 34.669 18.112999 33.721 17.895998 32.779 17.680998L32.779 17.680998L34.189 12.027998L30.679998 11.152998L29.241 16.918999C 28.477 16.744999 27.727 16.572998 26.998999 16.391998L26.998999 16.391998L27.002998 16.373999L22.161 15.164999L21.227 18.914999C 21.227 18.914999 23.831999 19.512 23.776999 19.549C 25.199 19.904 25.456 20.845 25.412998 21.591L25.412998 21.591L23.774998 28.161999C 23.872997 28.186998 23.999998 28.223 24.139997 28.279C 24.022997 28.25 23.897997 28.217999 23.768997 28.187L23.768997 28.187L21.472998 37.392C 21.298998 37.823997 20.857998 38.472 19.863998 38.225998C 19.898998 38.276997 17.311998 37.588997 17.311998 37.588997L17.311998 37.588997L15.568998 41.607998L20.137999 42.746998C 20.987999 42.96 21.821 43.183 22.640999 43.392998L22.640999 43.392998L21.188 49.226997L24.695 50.101997L26.133999 44.329998C 27.092 44.589996 28.022 44.829998 28.932 45.056L28.932 45.056L27.498 50.801L31.008999 51.676L32.461998 45.852997C 38.448997 46.985996 42.950996 46.528996 44.845997 41.114C 46.372997 36.753998 44.769997 34.239 41.619995 32.599C 43.913994 32.07 45.641994 30.560999 46.102997 27.443998L46.102997 27.443998L46.103 27.444zM38.081 38.693C 36.996002 43.053 29.655003 40.696 27.275002 40.105L27.275002 40.105L29.203001 32.376C 31.583 32.97 39.215 34.146 38.081 38.693zM39.167 27.381C 38.177 31.347 32.067 29.332 30.085 28.838001L30.085 28.838001L31.832998 21.828001C 33.815 22.322 40.197998 23.244001 39.167 27.381z" stroke="none" fill="#FFFFFF" fill-rule="nonzero"></path></g></g></svg>`;
      t12 = space();
      div8 = element("div");
      t13 = text(t13_value);
      t14 = space();
      div9 = element("div");
      t15 = text(t15_value);
      t16 = space();
      div14 = element("div");
      div11 = element("div");
      div11.textContent = "\u26A1";
      t18 = space();
      div12 = element("div");
      t19 = text(t19_value);
      t20 = space();
      div13 = element("div");
      div13.textContent = `${ctx[5]()} kW`;
      t23 = space();
      div19 = element("div");
      p1 = element("p");
      p1.textContent = "My Earnings";
      t25 = space();
      div18 = element("div");
      img = element("img");
      t26 = space();
      span0 = element("span");
      span0.textContent = "Bitcoin";
      t28 = space();
      span1 = element("span");
      t29 = text(t29_value);
      t30 = space();
      button = element("button");
      t31 = text(t31_value);
      t32 = space();
      if (if_block)
        if_block.c();
      attr(p0, "class", "text-2xl text-center font-bold pb-2 text-primary");
      attr(div0, "class", "stat-title");
      attr(div1, "class", "stat-value text-3xl");
      attr(div2, "class", "stat");
      attr(div3, "class", "stat-figure text-3xl");
      attr(div4, "class", "stat-title");
      attr(div5, "class", "stat-value text-3xl " + (onlineMiners() > 0 ? "text-success" : "text-error"));
      attr(div6, "class", "stat");
      attr(div7, "class", "stat-figure");
      attr(div8, "class", "stat-title");
      attr(div9, "class", "stat-value text-3xl");
      attr(div10, "class", "stat");
      attr(div11, "class", "stat-figure text-3xl");
      attr(div12, "class", "stat-title");
      attr(div13, "class", "stat-value text-3xl");
      attr(div14, "class", "stat");
      attr(div15, "class", "stats stats-horizontl w-fit mx-auto");
      attr(div16, "class", "card-body px-2");
      attr(div17, "class", "card bg-base-300");
      attr(p1, "class", "text-2xl font-bold");
      if (!src_url_equal(img.src, img_src_value = "./btc.png"))
        attr(img, "src", img_src_value);
      attr(img, "alt", "btc");
      attr(img, "class", "h-10 w-10 object-contain");
      attr(div18, "class", "flex gap-2 items-center justify-center");
      attr(button, "class", "btn btn-primary");
      attr(div19, "id", "balance");
      attr(div19, "class", "grid place-items-center gap-2 w-1/3 p-5 bg-base-300 text-xl rounded-box mx-auto");
      attr(main, "class", "card-body text-base-content");
    },
    m(target, anchor) {
      insert(target, main, anchor);
      append(main, p0);
      append(main, t1);
      append(main, div17);
      append(div17, div16);
      append(div16, div15);
      append(div15, div2);
      append(div2, div0);
      append(div0, t2);
      append(div2, t3);
      append(div2, div1);
      append(div1, t4);
      append(div15, t5);
      append(div15, div6);
      append(div6, div3);
      append(div6, t7);
      append(div6, div4);
      append(div4, t8);
      append(div6, t9);
      append(div6, div5);
      append(div5, t10);
      append(div15, t11);
      append(div15, div10);
      append(div10, div7);
      append(div10, t12);
      append(div10, div8);
      append(div8, t13);
      append(div10, t14);
      append(div10, div9);
      append(div9, t15);
      append(div15, t16);
      append(div15, div14);
      append(div14, div11);
      append(div14, t18);
      append(div14, div12);
      append(div12, t19);
      append(div14, t20);
      append(div14, div13);
      append(main, t23);
      append(main, div19);
      append(div19, p1);
      append(div19, t25);
      append(div19, div18);
      append(div18, img);
      append(div18, t26);
      append(div18, span0);
      append(div18, t28);
      append(div18, span1);
      append(span1, t29);
      append(div19, t30);
      append(div19, button);
      append(button, t31);
      append(main, t32);
      if (if_block)
        if_block.m(main, null);
      if (!mounted) {
        dispose = listen(button, "click", ctx[6]);
        mounted = true;
      }
    },
    p(ctx2, [dirty]) {
      if (dirty & 8 && t2_value !== (t2_value = ctx2[3]["GeneralStatistics"] + ""))
        set_data(t2, t2_value);
      if (dirty & 4 && t4_value !== (t4_value = ctx2[2].length + ""))
        set_data(t4, t4_value);
      if (dirty & 8 && t8_value !== (t8_value = ctx2[3]["MinersOnline"] + ""))
        set_data(t8, t8_value);
      if (dirty & 8 && t13_value !== (t13_value = ctx2[3]["BitcoinMined"] + ""))
        set_data(t13, t13_value);
      if (dirty & 16 && t15_value !== (t15_value = new Intl.NumberFormat("en-IN", { maximumSignificantDigits: 5 }).format(ctx2[4].mining.total) + ""))
        set_data(t15, t15_value);
      if (dirty & 8 && t19_value !== (t19_value = ctx2[3]["TotalPowerConsumption"] + ""))
        set_data(t19, t19_value);
      if (dirty & 1 && t29_value !== (t29_value = new Intl.NumberFormat("en-IN", { maximumFractionDigits: 5 }).format(ctx2[0]) + ""))
        set_data(t29, t29_value);
      if (dirty & 8 && t31_value !== (t31_value = ctx2[3]["Withdraw"] + ""))
        set_data(t31, t31_value);
      if (ctx2[2].length > 0) {
        if (if_block) {
          if_block.p(ctx2, dirty);
        } else {
          if_block = create_if_block$9(ctx2);
          if_block.c();
          if_block.m(main, null);
        }
      } else if (if_block) {
        if_block.d(1);
        if_block = null;
      }
    },
    i(local) {
      if (!main_intro) {
        add_render_callback(() => {
          main_intro = create_in_transition(main, fade, {});
          main_intro.start();
        });
      }
    },
    o: noop,
    d(detaching) {
      if (detaching)
        detach(main);
      if (if_block)
        if_block.d();
      mounted = false;
      dispose();
    }
  };
}
function instance$9($$self, $$props, $$invalidate) {
  let $playerBalance;
  let $Config;
  let $miners;
  let $Locale;
  let $statistics;
  component_subscribe($$self, playerBalance, ($$value) => $$invalidate(0, $playerBalance = $$value));
  component_subscribe($$self, Config, ($$value) => $$invalidate(1, $Config = $$value));
  component_subscribe($$self, miners, ($$value) => $$invalidate(2, $miners = $$value));
  component_subscribe($$self, Locale, ($$value) => $$invalidate(3, $Locale = $$value));
  component_subscribe($$self, statistics, ($$value) => $$invalidate(4, $statistics = $$value));
  function totalPower() {
    let power = 0;
    $miners.forEach((miner) => {
      if (miner.status) {
        power += miner.overclock * $Config.MinerSettings[miner.type].data.power;
      }
    });
    return power.toFixed(2);
  }
  async function withdraw() {
    const result = await Nui.send("withdraw");
    const data = await result.json();
    if (data)
      set_store_value(playerBalance, $playerBalance = 0, $playerBalance);
  }
  return [$playerBalance, $Config, $miners, $Locale, $statistics, totalPower, withdraw];
}
class Stats extends SvelteComponent {
  constructor(options) {
    super();
    init(this, options, instance$9, create_fragment$9, safe_not_equal, {});
  }
}
const miners_svelte_svelte_type_style_lang = "";
function get_each_context$4(ctx, list, i) {
  const child_ctx = ctx.slice();
  child_ctx[14] = list[i];
  child_ctx[16] = i;
  return child_ctx;
}
function create_else_block$4(ctx) {
  let p0;
  let t0_value = ctx[6]["AvailableMiners"] + "";
  let t0;
  let t1;
  let div1;
  let div0;
  let each_blocks = [];
  let each_1_lookup = /* @__PURE__ */ new Map();
  let t2;
  let t3;
  let input0;
  let t4;
  let label1;
  let label0;
  let h30;
  let t5_value = ctx[6]["Cooling"] + "";
  let t5;
  let t6;
  let p1;
  let span0;
  let t7_value = ctx[6]["Pros"] + "";
  let t7;
  let t8;
  let br0;
  let t9;
  let span1;
  let t10;
  let t11_value = ctx[6]["IncreasesLongevity"] + "";
  let t11;
  let t12;
  let br1;
  let t13;
  let span2;
  let t14_value = ctx[6]["Cons"] + "";
  let t14;
  let t15;
  let br2;
  let t16;
  let span3;
  let t17;
  let t18_value = ctx[6]["ConsumesMoreEnergy"] + "";
  let t18;
  let t19;
  let t20;
  let input1;
  let t21;
  let label3;
  let label2;
  let h31;
  let t22;
  let t23_value = ctx[6]["Overclocking"] + "";
  let t23;
  let t24;
  let p2;
  let span4;
  let t25_value = ctx[6]["Pros"] + "";
  let t25;
  let t26;
  let br3;
  let t27;
  let span5;
  let t28;
  let t29_value = ctx[6]["IncreasesPower"] + "";
  let t29;
  let t30;
  let br4;
  let t31;
  let span6;
  let t32_value = ctx[6]["Cons"] + "";
  let t32;
  let t33;
  let br5;
  let t34;
  let span7;
  let t35;
  let t36_value = ctx[6]["ConsumesMoreEnergy"] + "";
  let t36;
  let t37;
  let br6;
  let t38;
  let t39_value = ctx[6]["IncreasesTemperature"] + "";
  let t39;
  let t40;
  let br7;
  let t41;
  let t42_value = ctx[6]["WearsOutQuicker"] + "";
  let t42;
  let t43;
  let br8;
  let each_value = ctx[5];
  const get_key = (ctx2) => ctx2[14].id;
  for (let i = 0; i < each_value.length; i += 1) {
    let child_ctx = get_each_context$4(ctx, each_value, i);
    let key = get_key(child_ctx);
    each_1_lookup.set(key, each_blocks[i] = create_each_block$4(key, child_ctx));
  }
  let if_block = ctx[2] && ctx[3][ctx[2]] && create_if_block_3$2(ctx);
  return {
    c() {
      p0 = element("p");
      t0 = text(t0_value);
      t1 = space();
      div1 = element("div");
      div0 = element("div");
      for (let i = 0; i < each_blocks.length; i += 1) {
        each_blocks[i].c();
      }
      t2 = space();
      if (if_block)
        if_block.c();
      t3 = space();
      input0 = element("input");
      t4 = space();
      label1 = element("label");
      label0 = element("label");
      h30 = element("h3");
      t5 = text(t5_value);
      t6 = space();
      p1 = element("p");
      span0 = element("span");
      t7 = text(t7_value);
      t8 = space();
      br0 = element("br");
      t9 = space();
      span1 = element("span");
      t10 = text("- ");
      t11 = text(t11_value);
      t12 = text(".");
      br1 = element("br");
      t13 = space();
      span2 = element("span");
      t14 = text(t14_value);
      t15 = space();
      br2 = element("br");
      t16 = space();
      span3 = element("span");
      t17 = text("- ");
      t18 = text(t18_value);
      t19 = text(".");
      t20 = space();
      input1 = element("input");
      t21 = space();
      label3 = element("label");
      label2 = element("label");
      h31 = element("h3");
      t22 = text('"');
      t23 = text(t23_value);
      t24 = space();
      p2 = element("p");
      span4 = element("span");
      t25 = text(t25_value);
      t26 = space();
      br3 = element("br");
      t27 = space();
      span5 = element("span");
      t28 = text("- ");
      t29 = text(t29_value);
      t30 = text(" (hashrate).");
      br4 = element("br");
      t31 = space();
      span6 = element("span");
      t32 = text(t32_value);
      t33 = space();
      br5 = element("br");
      t34 = space();
      span7 = element("span");
      t35 = text("- ");
      t36 = text(t36_value);
      t37 = text(", ");
      br6 = element("br");
      t38 = text("\r\n            - ");
      t39 = text(t39_value);
      t40 = text(", ");
      br7 = element("br");
      t41 = text("\r\n            - ");
      t42 = text(t42_value);
      t43 = text(".");
      br8 = element("br");
      attr(p0, "class", "text-center text-primary text-2xl font-bold");
      attr(div0, "class", "inline-flex gap-4");
      attr(div1, "class", "rounded-box p-5 bg-base-300 w-full overflow-x-auto");
      attr(input0, "type", "checkbox");
      attr(input0, "id", "coolingInfo");
      attr(input0, "class", "modal-toggle");
      attr(h30, "class", "text-lg font-bold text-primary");
      attr(span0, "class", "text-green-500 font-bold");
      attr(span2, "class", "text-red-500 font-bold");
      attr(p1, "class", "py-4");
      attr(label0, "class", "modal-box relative");
      attr(label0, "for", "");
      attr(label1, "for", "coolingInfo");
      attr(label1, "class", "modal cursor-pointer");
      attr(input1, "type", "checkbox");
      attr(input1, "id", "overclockingInfo");
      attr(input1, "class", "modal-toggle");
      attr(h31, "class", "text-lg font-bold text-primary");
      attr(span4, "class", "text-green-500 font-bold");
      attr(span6, "class", "text-red-500 font-bold");
      attr(p2, "class", "py-4");
      attr(label2, "class", "modal-box relative");
      attr(label2, "for", "");
      attr(label3, "for", "overclockingInfo");
      attr(label3, "class", "modal cursor-pointer");
    },
    m(target, anchor) {
      insert(target, p0, anchor);
      append(p0, t0);
      insert(target, t1, anchor);
      insert(target, div1, anchor);
      append(div1, div0);
      for (let i = 0; i < each_blocks.length; i += 1) {
        each_blocks[i].m(div0, null);
      }
      insert(target, t2, anchor);
      if (if_block)
        if_block.m(target, anchor);
      insert(target, t3, anchor);
      insert(target, input0, anchor);
      insert(target, t4, anchor);
      insert(target, label1, anchor);
      append(label1, label0);
      append(label0, h30);
      append(h30, t5);
      append(label0, t6);
      append(label0, p1);
      append(p1, span0);
      append(span0, t7);
      append(span0, t8);
      append(span0, br0);
      append(p1, t9);
      append(p1, span1);
      append(span1, t10);
      append(span1, t11);
      append(span1, t12);
      append(span1, br1);
      append(p1, t13);
      append(p1, span2);
      append(span2, t14);
      append(span2, t15);
      append(span2, br2);
      append(p1, t16);
      append(p1, span3);
      append(span3, t17);
      append(span3, t18);
      append(span3, t19);
      insert(target, t20, anchor);
      insert(target, input1, anchor);
      insert(target, t21, anchor);
      insert(target, label3, anchor);
      append(label3, label2);
      append(label2, h31);
      append(h31, t22);
      append(h31, t23);
      append(label2, t24);
      append(label2, p2);
      append(p2, span4);
      append(span4, t25);
      append(span4, t26);
      append(span4, br3);
      append(p2, t27);
      append(p2, span5);
      append(span5, t28);
      append(span5, t29);
      append(span5, t30);
      append(span5, br4);
      append(p2, t31);
      append(p2, span6);
      append(span6, t32);
      append(span6, t33);
      append(span6, br5);
      append(p2, t34);
      append(p2, span7);
      append(span7, t35);
      append(span7, t36);
      append(span7, t37);
      append(span7, br6);
      append(span7, t38);
      append(span7, t39);
      append(span7, t40);
      append(span7, br7);
      append(span7, t41);
      append(span7, t42);
      append(span7, t43);
      append(span7, br8);
    },
    p(ctx2, dirty) {
      if (dirty & 64 && t0_value !== (t0_value = ctx2[6]["AvailableMiners"] + ""))
        set_data(t0, t0_value);
      if (dirty & 612) {
        each_value = ctx2[5];
        each_blocks = update_keyed_each(each_blocks, dirty, get_key, 1, ctx2, each_value, each_1_lookup, div0, destroy_block, create_each_block$4, null, get_each_context$4);
      }
      if (ctx2[2] && ctx2[3][ctx2[2]]) {
        if (if_block) {
          if_block.p(ctx2, dirty);
        } else {
          if_block = create_if_block_3$2(ctx2);
          if_block.c();
          if_block.m(t3.parentNode, t3);
        }
      } else if (if_block) {
        if_block.d(1);
        if_block = null;
      }
      if (dirty & 64 && t5_value !== (t5_value = ctx2[6]["Cooling"] + ""))
        set_data(t5, t5_value);
      if (dirty & 64 && t7_value !== (t7_value = ctx2[6]["Pros"] + ""))
        set_data(t7, t7_value);
      if (dirty & 64 && t11_value !== (t11_value = ctx2[6]["IncreasesLongevity"] + ""))
        set_data(t11, t11_value);
      if (dirty & 64 && t14_value !== (t14_value = ctx2[6]["Cons"] + ""))
        set_data(t14, t14_value);
      if (dirty & 64 && t18_value !== (t18_value = ctx2[6]["ConsumesMoreEnergy"] + ""))
        set_data(t18, t18_value);
      if (dirty & 64 && t23_value !== (t23_value = ctx2[6]["Overclocking"] + ""))
        set_data(t23, t23_value);
      if (dirty & 64 && t25_value !== (t25_value = ctx2[6]["Pros"] + ""))
        set_data(t25, t25_value);
      if (dirty & 64 && t29_value !== (t29_value = ctx2[6]["IncreasesPower"] + ""))
        set_data(t29, t29_value);
      if (dirty & 64 && t32_value !== (t32_value = ctx2[6]["Cons"] + ""))
        set_data(t32, t32_value);
      if (dirty & 64 && t36_value !== (t36_value = ctx2[6]["ConsumesMoreEnergy"] + ""))
        set_data(t36, t36_value);
      if (dirty & 64 && t39_value !== (t39_value = ctx2[6]["IncreasesTemperature"] + ""))
        set_data(t39, t39_value);
      if (dirty & 64 && t42_value !== (t42_value = ctx2[6]["WearsOutQuicker"] + ""))
        set_data(t42, t42_value);
    },
    d(detaching) {
      if (detaching)
        detach(p0);
      if (detaching)
        detach(t1);
      if (detaching)
        detach(div1);
      for (let i = 0; i < each_blocks.length; i += 1) {
        each_blocks[i].d();
      }
      if (detaching)
        detach(t2);
      if (if_block)
        if_block.d(detaching);
      if (detaching)
        detach(t3);
      if (detaching)
        detach(input0);
      if (detaching)
        detach(t4);
      if (detaching)
        detach(label1);
      if (detaching)
        detach(t20);
      if (detaching)
        detach(input1);
      if (detaching)
        detach(t21);
      if (detaching)
        detach(label3);
    }
  };
}
function create_if_block_2$4(ctx) {
  let p0;
  let t0_value = ctx[6]["YouDontHaveAvailableMiners"] + "";
  let t0;
  let t1;
  let p1;
  return {
    c() {
      p0 = element("p");
      t0 = text(t0_value);
      t1 = space();
      p1 = element("p");
      p1.textContent = "\u{1F61E}";
      attr(p0, "class", "text-center text-primary text-2xl font-bold");
      attr(p1, "class", "text-center text-2xl");
    },
    m(target, anchor) {
      insert(target, p0, anchor);
      append(p0, t0);
      insert(target, t1, anchor);
      insert(target, p1, anchor);
    },
    p(ctx2, dirty) {
      if (dirty & 64 && t0_value !== (t0_value = ctx2[6]["YouDontHaveAvailableMiners"] + ""))
        set_data(t0, t0_value);
    },
    d(detaching) {
      if (detaching)
        detach(p0);
      if (detaching)
        detach(t1);
      if (detaching)
        detach(p1);
    }
  };
}
function create_if_block_1$5(ctx) {
  let p;
  let t_value = ctx[6]["StopMiningBeforeUse"] + "";
  let t;
  return {
    c() {
      p = element("p");
      t = text(t_value);
      attr(p, "class", "text-center");
    },
    m(target, anchor) {
      insert(target, p, anchor);
      append(p, t);
    },
    p(ctx2, dirty) {
      if (dirty & 64 && t_value !== (t_value = ctx2[6]["StopMiningBeforeUse"] + ""))
        set_data(t, t_value);
    },
    d(detaching) {
      if (detaching)
        detach(p);
    }
  };
}
function create_if_block$8(ctx) {
  let p;
  let t_value = ctx[6]["Loading"] + "";
  let t;
  return {
    c() {
      p = element("p");
      t = text(t_value);
      attr(p, "class", "text-center text-primary text-2xl font-bold");
    },
    m(target, anchor) {
      insert(target, p, anchor);
      append(p, t);
    },
    p(ctx2, dirty) {
      if (dirty & 64 && t_value !== (t_value = ctx2[6]["Loading"] + ""))
        set_data(t, t_value);
    },
    d(detaching) {
      if (detaching)
        detach(p);
    }
  };
}
function create_each_block$4(key_1, ctx) {
  let div2;
  let div1;
  let h2;
  let t0_value = ctx[6]["Miner"] + "";
  let t0;
  let t1;
  let t2_value = ctx[16] + 1 + "";
  let t2;
  let t3;
  let t4_value = ctx[14].status ? "\u{1F7E2}" : "\u{1F534}";
  let t4;
  let t5;
  let img;
  let img_src_value;
  let t6;
  let div0;
  let button;
  let t7_value = ctx[6]["Select"] + "";
  let t7;
  let t8;
  let mounted;
  let dispose;
  function click_handler() {
    return ctx[10](ctx[14]);
  }
  return {
    key: key_1,
    first: null,
    c() {
      div2 = element("div");
      div1 = element("div");
      h2 = element("h2");
      t0 = text(t0_value);
      t1 = space();
      t2 = text(t2_value);
      t3 = space();
      t4 = text(t4_value);
      t5 = space();
      img = element("img");
      t6 = space();
      div0 = element("div");
      button = element("button");
      t7 = text(t7_value);
      t8 = space();
      attr(h2, "class", "text-xl font-semibold text-center text-primary");
      if (!src_url_equal(img.src, img_src_value = "./miner.png"))
        attr(img, "src", img_src_value);
      attr(img, "alt", "miner");
      attr(img, "class", "w-3/5 mx-auto my-2");
      attr(button, "class", "btn btn-primary btn-sm flex-grow");
      attr(div0, "class", "card-actions justify-center flex-nowrap");
      attr(div1, "class", "p-5");
      attr(div2, "class", "card w-56 bg-base-100 text-base-content border-primary");
      toggle_class(div2, "border-4", ctx[2] === ctx[14].id);
      this.first = div2;
    },
    m(target, anchor) {
      insert(target, div2, anchor);
      append(div2, div1);
      append(div1, h2);
      append(h2, t0);
      append(h2, t1);
      append(h2, t2);
      append(h2, t3);
      append(h2, t4);
      append(div1, t5);
      append(div1, img);
      append(div1, t6);
      append(div1, div0);
      append(div0, button);
      append(button, t7);
      append(div2, t8);
      if (!mounted) {
        dispose = listen(button, "click", click_handler);
        mounted = true;
      }
    },
    p(new_ctx, dirty) {
      ctx = new_ctx;
      if (dirty & 64 && t0_value !== (t0_value = ctx[6]["Miner"] + ""))
        set_data(t0, t0_value);
      if (dirty & 32 && t2_value !== (t2_value = ctx[16] + 1 + ""))
        set_data(t2, t2_value);
      if (dirty & 32 && t4_value !== (t4_value = ctx[14].status ? "\u{1F7E2}" : "\u{1F534}"))
        set_data(t4, t4_value);
      if (dirty & 64 && t7_value !== (t7_value = ctx[6]["Select"] + ""))
        set_data(t7, t7_value);
      if (dirty & 36) {
        toggle_class(div2, "border-4", ctx[2] === ctx[14].id);
      }
    },
    d(detaching) {
      if (detaching)
        detach(div2);
      mounted = false;
      dispose();
    }
  };
}
function create_if_block_3$2(ctx) {
  let div3;
  let div0;
  let t0_value = ctx[6]["Cooling"] + "";
  let t0;
  let t1;
  let input0;
  let t2;
  let div2;
  let p0;
  let t3_value = ctx[6]["Fanspeed"] + "";
  let t3;
  let t4;
  let t5_value = ctx[3][ctx[2]].fanspeed + "";
  let t5;
  let t6;
  let t7;
  let div1;
  let p1;
  let label0;
  let t8_value = ctx[6]["Info"] + "";
  let t8;
  let t9;
  let div6;
  let p2;
  let t10_value = ctx[6]["Overclocking"] + "";
  let t10;
  let t11;
  let input1;
  let t12;
  let div5;
  let p3;
  let t13;
  let t14_value = ctx[3][ctx[2]].overclock + "";
  let t14;
  let t15;
  let t16;
  let div4;
  let p4;
  let label1;
  let t17_value = ctx[6]["Info"] + "";
  let t17;
  let t18;
  let div7;
  let button0;
  let t19_value = ctx[6]["ApplyToAllMiners"] + "";
  let t19;
  let button0_disabled_value;
  let t20;
  let button1;
  let t21_value = ctx[6]["Apply"] + "";
  let t21;
  let button1_disabled_value;
  let mounted;
  let dispose;
  return {
    c() {
      div3 = element("div");
      div0 = element("div");
      t0 = text(t0_value);
      t1 = space();
      input0 = element("input");
      t2 = space();
      div2 = element("div");
      p0 = element("p");
      t3 = text(t3_value);
      t4 = space();
      t5 = text(t5_value);
      t6 = text("%");
      t7 = space();
      div1 = element("div");
      p1 = element("p");
      label0 = element("label");
      t8 = text(t8_value);
      t9 = space();
      div6 = element("div");
      p2 = element("p");
      t10 = text(t10_value);
      t11 = space();
      input1 = element("input");
      t12 = space();
      div5 = element("div");
      p3 = element("p");
      t13 = text("Overclock: ");
      t14 = text(t14_value);
      t15 = text("x");
      t16 = space();
      div4 = element("div");
      p4 = element("p");
      label1 = element("label");
      t17 = text(t17_value);
      t18 = space();
      div7 = element("div");
      button0 = element("button");
      t19 = text(t19_value);
      t20 = space();
      button1 = element("button");
      t21 = text(t21_value);
      attr(div0, "class", "text-primary font-l font-semibold");
      attr(input0, "type", "range");
      attr(input0, "class", "flex-grow range svelte-176u9nv");
      attr(input0, "max", "100");
      toggle_class(input0, "range-success", ctx[3][ctx[2]].fanspeed < 56);
      toggle_class(input0, "range-warning", ctx[3][ctx[2]].fanspeed > 55 && ctx[3][ctx[2]].fanspeed < 86);
      toggle_class(input0, "range-error", ctx[3][ctx[2]].fanspeed > 85);
      attr(label0, "for", "coolingInfo");
      attr(label0, "class", "btn modal-button btn-info w-fit");
      attr(div1, "class", "justify-end");
      attr(div2, "class", "flex items-center gap-2 w-full");
      attr(div3, "class", "card card-body bg-base-300");
      attr(p2, "class", "text-primary font-l font-semibold");
      attr(input1, "type", "range");
      attr(input1, "class", "flex-grow range svelte-176u9nv");
      attr(input1, "min", "1");
      attr(input1, "step", "0.01");
      attr(input1, "max", "2");
      toggle_class(input1, "range-success", ctx[3][ctx[2]].overclock < 1.56);
      toggle_class(input1, "range-warning", ctx[3][ctx[2]].overclock > 1.55 && ctx[3][ctx[2]].overclock < 1.86);
      toggle_class(input1, "range-error", ctx[3][ctx[2]].overclock > 1.85);
      attr(label1, "for", "overclockingInfo");
      attr(label1, "class", "btn modal-button btn-info w-fit");
      attr(div4, "class", "justify-end");
      attr(div5, "class", "flex items-center gap-2 w-full");
      attr(div6, "class", "card card-body bg-base-300");
      button0.disabled = button0_disabled_value = !ctx[4];
      attr(button0, "class", "btn btn-secondary flex-grow");
      button1.disabled = button1_disabled_value = !ctx[4];
      attr(button1, "class", "btn btn-primary flex-grow");
      attr(div7, "class", "flex w-full gap-2");
    },
    m(target, anchor) {
      insert(target, div3, anchor);
      append(div3, div0);
      append(div0, t0);
      append(div3, t1);
      append(div3, input0);
      set_input_value(input0, ctx[3][ctx[2]].fanspeed);
      append(div3, t2);
      append(div3, div2);
      append(div2, p0);
      append(p0, t3);
      append(p0, t4);
      append(p0, t5);
      append(p0, t6);
      append(div2, t7);
      append(div2, div1);
      append(div1, p1);
      append(p1, label0);
      append(label0, t8);
      insert(target, t9, anchor);
      insert(target, div6, anchor);
      append(div6, p2);
      append(p2, t10);
      append(div6, t11);
      append(div6, input1);
      set_input_value(input1, ctx[3][ctx[2]].overclock);
      append(div6, t12);
      append(div6, div5);
      append(div5, p3);
      append(p3, t13);
      append(p3, t14);
      append(p3, t15);
      append(div5, t16);
      append(div5, div4);
      append(div4, p4);
      append(p4, label1);
      append(label1, t17);
      insert(target, t18, anchor);
      insert(target, div7, anchor);
      append(div7, button0);
      append(button0, t19);
      append(div7, t20);
      append(div7, button1);
      append(button1, t21);
      if (!mounted) {
        dispose = [
          listen(input0, "change", ctx[11]),
          listen(input0, "input", ctx[11]),
          listen(input1, "change", ctx[12]),
          listen(input1, "input", ctx[12]),
          listen(button0, "click", ctx[8]),
          listen(button1, "click", ctx[7])
        ];
        mounted = true;
      }
    },
    p(ctx2, dirty) {
      if (dirty & 64 && t0_value !== (t0_value = ctx2[6]["Cooling"] + ""))
        set_data(t0, t0_value);
      if (dirty & 12) {
        set_input_value(input0, ctx2[3][ctx2[2]].fanspeed);
      }
      if (dirty & 12) {
        toggle_class(input0, "range-success", ctx2[3][ctx2[2]].fanspeed < 56);
      }
      if (dirty & 12) {
        toggle_class(input0, "range-warning", ctx2[3][ctx2[2]].fanspeed > 55 && ctx2[3][ctx2[2]].fanspeed < 86);
      }
      if (dirty & 12) {
        toggle_class(input0, "range-error", ctx2[3][ctx2[2]].fanspeed > 85);
      }
      if (dirty & 64 && t3_value !== (t3_value = ctx2[6]["Fanspeed"] + ""))
        set_data(t3, t3_value);
      if (dirty & 12 && t5_value !== (t5_value = ctx2[3][ctx2[2]].fanspeed + ""))
        set_data(t5, t5_value);
      if (dirty & 64 && t8_value !== (t8_value = ctx2[6]["Info"] + ""))
        set_data(t8, t8_value);
      if (dirty & 64 && t10_value !== (t10_value = ctx2[6]["Overclocking"] + ""))
        set_data(t10, t10_value);
      if (dirty & 12) {
        set_input_value(input1, ctx2[3][ctx2[2]].overclock);
      }
      if (dirty & 12) {
        toggle_class(input1, "range-success", ctx2[3][ctx2[2]].overclock < 1.56);
      }
      if (dirty & 12) {
        toggle_class(input1, "range-warning", ctx2[3][ctx2[2]].overclock > 1.55 && ctx2[3][ctx2[2]].overclock < 1.86);
      }
      if (dirty & 12) {
        toggle_class(input1, "range-error", ctx2[3][ctx2[2]].overclock > 1.85);
      }
      if (dirty & 12 && t14_value !== (t14_value = ctx2[3][ctx2[2]].overclock + ""))
        set_data(t14, t14_value);
      if (dirty & 64 && t17_value !== (t17_value = ctx2[6]["Info"] + ""))
        set_data(t17, t17_value);
      if (dirty & 64 && t19_value !== (t19_value = ctx2[6]["ApplyToAllMiners"] + ""))
        set_data(t19, t19_value);
      if (dirty & 16 && button0_disabled_value !== (button0_disabled_value = !ctx2[4])) {
        button0.disabled = button0_disabled_value;
      }
      if (dirty & 64 && t21_value !== (t21_value = ctx2[6]["Apply"] + ""))
        set_data(t21, t21_value);
      if (dirty & 16 && button1_disabled_value !== (button1_disabled_value = !ctx2[4])) {
        button1.disabled = button1_disabled_value;
      }
    },
    d(detaching) {
      if (detaching)
        detach(div3);
      if (detaching)
        detach(t9);
      if (detaching)
        detach(div6);
      if (detaching)
        detach(t18);
      if (detaching)
        detach(div7);
      mounted = false;
      run_all(dispose);
    }
  };
}
function create_fragment$8(ctx) {
  let main;
  let main_intro;
  function select_block_type(ctx2, dirty) {
    if (ctx2[0])
      return create_if_block$8;
    if (ctx2[1])
      return create_if_block_1$5;
    if (ctx2[5].length === 0)
      return create_if_block_2$4;
    return create_else_block$4;
  }
  let current_block_type = select_block_type(ctx);
  let if_block = current_block_type(ctx);
  return {
    c() {
      main = element("main");
      if_block.c();
      attr(main, "class", "w-full card-body");
    },
    m(target, anchor) {
      insert(target, main, anchor);
      if_block.m(main, null);
    },
    p(ctx2, [dirty]) {
      if (current_block_type === (current_block_type = select_block_type(ctx2)) && if_block) {
        if_block.p(ctx2, dirty);
      } else {
        if_block.d(1);
        if_block = current_block_type(ctx2);
        if (if_block) {
          if_block.c();
          if_block.m(main, null);
        }
      }
    },
    i(local) {
      if (!main_intro) {
        add_render_callback(() => {
          main_intro = create_in_transition(main, fade, {});
          main_intro.start();
        });
      }
    },
    o: noop,
    d(detaching) {
      if (detaching)
        detach(main);
      if_block.d();
    }
  };
}
function instance$8($$self, $$props, $$invalidate) {
  let $Locale;
  component_subscribe($$self, Locale, ($$value) => $$invalidate(6, $Locale = $$value));
  let loading = true;
  let isMining2 = false;
  let targetMinerID;
  let minersChanged = {};
  let canInteract = true;
  let miners2 = [];
  async function UpdateMiners() {
    $$invalidate(4, canInteract = false);
    const result = await Nui.send("UpdateMiners", minersChanged);
    const data = await result.json();
    if (data) {
      $$invalidate(5, miners2 = data.miners);
      $$invalidate(1, isMining2 = data.isMining);
    }
    $$invalidate(4, canInteract = true);
  }
  async function GetMiners() {
    const result = await Nui.send("GetMinersAndStatus");
    const data = await result.json();
    if (data) {
      $$invalidate(1, isMining2 = data.isMining);
      $$invalidate(5, miners2 = data.miners);
    }
    $$invalidate(0, loading = false);
  }
  function UpdateAllMiners() {
    miners2.forEach((miner) => {
      $$invalidate(
        3,
        minersChanged[miner.id] = {
          fanspeed: minersChanged[targetMinerID].fanspeed,
          overclock: minersChanged[targetMinerID].overclock,
          status: miner.status
        },
        minersChanged
      );
    });
    UpdateMiners();
  }
  GetMiners();
  function SelectMiner(id) {
    const miner = miners2.find((m) => m.id == id);
    if (!miner)
      return;
    $$invalidate(2, targetMinerID = miner.id);
    $$invalidate(3, minersChanged = {});
    $$invalidate(
      3,
      minersChanged[miner.id] = {
        fanspeed: miner.fanspeed,
        overclock: miner.overclock,
        status: miner.status
      },
      minersChanged
    );
  }
  const click_handler = (miner) => SelectMiner(miner.id);
  function input0_change_input_handler() {
    minersChanged[targetMinerID].fanspeed = to_number(this.value);
    $$invalidate(3, minersChanged);
  }
  function input1_change_input_handler() {
    minersChanged[targetMinerID].overclock = to_number(this.value);
    $$invalidate(3, minersChanged);
  }
  return [
    loading,
    isMining2,
    targetMinerID,
    minersChanged,
    canInteract,
    miners2,
    $Locale,
    UpdateMiners,
    UpdateAllMiners,
    SelectMiner,
    click_handler,
    input0_change_input_handler,
    input1_change_input_handler
  ];
}
class Miners extends SvelteComponent {
  constructor(options) {
    super();
    init(this, options, instance$8, create_fragment$8, safe_not_equal, {});
  }
}
function get_each_context$3(ctx, list, i) {
  const child_ctx = ctx.slice();
  child_ctx[21] = list[i];
  return child_ctx;
}
function get_each_context_1$1(ctx, list, i) {
  const child_ctx = ctx.slice();
  child_ctx[24] = list[i];
  return child_ctx;
}
function get_each_context_2(ctx, list, i) {
  const child_ctx = ctx.slice();
  child_ctx[21] = list[i];
  const constants_0 = child_ctx[1].MinerSettings[child_ctx[21]];
  child_ctx[27] = constants_0;
  return child_ctx;
}
function get_each_context_3(ctx, list, i) {
  const child_ctx = ctx.slice();
  child_ctx[21] = list[i];
  const constants_0 = child_ctx[1].MinerSettings[child_ctx[21]];
  child_ctx[27] = constants_0;
  return child_ctx;
}
function create_each_block_3(key_1, ctx) {
  var _a, _b;
  let button;
  let img;
  let img_src_value;
  let img_alt_value;
  let t0;
  let p0;
  let t1_value = ((_a = ctx[27]) == null ? void 0 : _a.label) + "";
  let t1;
  let t2;
  let p1;
  let t3_value = currency((_b = ctx[27]) == null ? void 0 : _b.price) + "";
  let t3;
  let t4;
  let label;
  let i;
  let label_for_value;
  let t5;
  let mounted;
  let dispose;
  function click_handler() {
    return ctx[12](ctx[21]);
  }
  return {
    key: key_1,
    first: null,
    c() {
      var _a2, _b2;
      button = element("button");
      img = element("img");
      t0 = space();
      p0 = element("p");
      t1 = text(t1_value);
      t2 = space();
      p1 = element("p");
      t3 = text(t3_value);
      t4 = space();
      label = element("label");
      i = element("i");
      t5 = space();
      if (!src_url_equal(img.src, img_src_value = "./miners/" + ((_a2 = ctx[27]) == null ? void 0 : _a2.model) + ".png"))
        attr(img, "src", img_src_value);
      attr(img, "draggable", "false");
      attr(img, "alt", img_alt_value = (_b2 = ctx[27]) == null ? void 0 : _b2.label);
      attr(img, "class", "h-[65%] aspect-square object-contain");
      attr(p0, "class", "text-center font-bold text-xl");
      attr(i, "class", "fa-solid fa-circle-info text-info");
      attr(label, "for", label_for_value = ctx[21] + "-modal");
      attr(label, "class", "active:scale-95 cursor-pointer select-none ease-in-out duration-100 absolute right-0");
      attr(p1, "class", "w-full text-center relative text-lg");
      attr(button, "class", "flex flex-col items-center justify-center gap-2 w-60 h-60 p-5 bg-base-300 rounded-box aspect-square select-none border-2 ease-in-out duration-200 cursor-pointer hover:border-primary");
      toggle_class(button, "border-base-300", ctx[0] !== ctx[21]);
      toggle_class(button, "border-primary", ctx[0] === ctx[21]);
      this.first = button;
    },
    m(target, anchor) {
      insert(target, button, anchor);
      append(button, img);
      append(button, t0);
      append(button, p0);
      append(p0, t1);
      append(button, t2);
      append(button, p1);
      append(p1, t3);
      append(p1, t4);
      append(p1, label);
      append(label, i);
      append(button, t5);
      if (!mounted) {
        dispose = listen(button, "click", click_handler);
        mounted = true;
      }
    },
    p(new_ctx, dirty) {
      var _a2, _b2, _c, _d;
      ctx = new_ctx;
      if (dirty[0] & 2 && !src_url_equal(img.src, img_src_value = "./miners/" + ((_a2 = ctx[27]) == null ? void 0 : _a2.model) + ".png")) {
        attr(img, "src", img_src_value);
      }
      if (dirty[0] & 2 && img_alt_value !== (img_alt_value = (_b2 = ctx[27]) == null ? void 0 : _b2.label)) {
        attr(img, "alt", img_alt_value);
      }
      if (dirty[0] & 2 && t1_value !== (t1_value = ((_c = ctx[27]) == null ? void 0 : _c.label) + ""))
        set_data(t1, t1_value);
      if (dirty[0] & 2 && t3_value !== (t3_value = currency((_d = ctx[27]) == null ? void 0 : _d.price) + ""))
        set_data(t3, t3_value);
      if (dirty[0] & 2 && label_for_value !== (label_for_value = ctx[21] + "-modal")) {
        attr(label, "for", label_for_value);
      }
      if (dirty[0] & 3) {
        toggle_class(button, "border-base-300", ctx[0] !== ctx[21]);
      }
      if (dirty[0] & 3) {
        toggle_class(button, "border-primary", ctx[0] === ctx[21]);
      }
    },
    d(detaching) {
      if (detaching)
        detach(button);
      mounted = false;
      dispose();
    }
  };
}
function create_if_block_4(ctx) {
  let div1;
  let label;
  let t0_value = ctx[7]["Stock"] + "";
  let t0;
  let t1;
  let div0;
  let t2_value = Object.values(ctx[5]).length < 99 ? `${Object.values(ctx[5]).length}` : `+99`;
  let t2;
  return {
    c() {
      div1 = element("div");
      label = element("label");
      t0 = text(t0_value);
      t1 = space();
      div0 = element("div");
      t2 = text(t2_value);
      attr(div0, "class", "badge");
      attr(label, "for", "stock-modal");
      attr(label, "class", "flex btn btn-info btn-sm items-center justify-end modal-button gap-2 w-fit");
      attr(div1, "class", "absolute -translate-y-1/2 top-1/2 left-0");
    },
    m(target, anchor) {
      insert(target, div1, anchor);
      append(div1, label);
      append(label, t0);
      append(label, t1);
      append(label, div0);
      append(div0, t2);
    },
    p(ctx2, dirty) {
      if (dirty[0] & 128 && t0_value !== (t0_value = ctx2[7]["Stock"] + ""))
        set_data(t0, t0_value);
      if (dirty[0] & 32 && t2_value !== (t2_value = Object.values(ctx2[5]).length < 99 ? `${Object.values(ctx2[5]).length}` : `+99`))
        set_data(t2, t2_value);
    },
    d(detaching) {
      if (detaching)
        detach(div1);
    }
  };
}
function create_if_block_3$1(ctx) {
  let div1;
  let label;
  let t0_value = ctx[7]["Orders"] + "";
  let t0;
  let t1;
  let div0;
  let t2_value = ctx[4].length < 99 ? `${ctx[4].length}` : `+99`;
  let t2;
  return {
    c() {
      div1 = element("div");
      label = element("label");
      t0 = text(t0_value);
      t1 = space();
      div0 = element("div");
      t2 = text(t2_value);
      attr(div0, "class", "badge");
      attr(label, "for", "orders-modal");
      attr(label, "class", "flex btn btn-primary btn-sm items-center justify-end modal-button gap-2 w-fit");
      attr(div1, "class", "absolute -translate-y-1/2 top-1/2 right-0");
    },
    m(target, anchor) {
      insert(target, div1, anchor);
      append(div1, label);
      append(label, t0);
      append(label, t1);
      append(label, div0);
      append(div0, t2);
    },
    p(ctx2, dirty) {
      if (dirty[0] & 128 && t0_value !== (t0_value = ctx2[7]["Orders"] + ""))
        set_data(t0, t0_value);
      if (dirty[0] & 16 && t2_value !== (t2_value = ctx2[4].length < 99 ? `${ctx2[4].length}` : `+99`))
        set_data(t2, t2_value);
    },
    d(detaching) {
      if (detaching)
        detach(div1);
    }
  };
}
function create_if_block_2$3(ctx) {
  var _a, _b;
  let div;
  let p0;
  let t0_value = ((_a = ctx[6]) == null ? void 0 : _a.label) + "";
  let t0;
  let t1;
  let img;
  let img_src_value;
  let t2;
  let p1;
  let t3_value = ctx[7]["Amount"] + "";
  let t3;
  let t4;
  let input;
  let t5;
  let button;
  let t6_value = ctx[7]["Order"] + "";
  let t6;
  let t7;
  let p2;
  let t8_value = ctx[7]["Total"] + "";
  let t8;
  let t9;
  let p3;
  let t10_value = currency(ctx[3] * ((_b = ctx[6]) == null ? void 0 : _b.price) || 0) + "";
  let t10;
  let mounted;
  let dispose;
  return {
    c() {
      var _a2;
      div = element("div");
      p0 = element("p");
      t0 = text(t0_value);
      t1 = space();
      img = element("img");
      t2 = space();
      p1 = element("p");
      t3 = text(t3_value);
      t4 = space();
      input = element("input");
      t5 = space();
      button = element("button");
      t6 = text(t6_value);
      t7 = space();
      p2 = element("p");
      t8 = text(t8_value);
      t9 = space();
      p3 = element("p");
      t10 = text(t10_value);
      attr(p0, "class", "font-bold text-3xl");
      if (!src_url_equal(img.src, img_src_value = "./miners/" + ((_a2 = ctx[6]) == null ? void 0 : _a2.model) + ".png"))
        attr(img, "src", img_src_value);
      attr(img, "alt", "");
      attr(img, "class", "w-36");
      attr(input, "type", "number");
      attr(input, "min", "1");
      attr(input, "class", "input input-primary w-48 focus:outline-none");
      attr(button, "class", "btn btn-success w-48 mt-2");
      attr(p2, "class", "mt-10 text-xl font-bold");
      attr(p3, "class", "text-lg");
      attr(div, "class", "flex flex-col w-full items-center justify-center");
    },
    m(target, anchor) {
      insert(target, div, anchor);
      append(div, p0);
      append(p0, t0);
      append(div, t1);
      append(div, img);
      append(div, t2);
      append(div, p1);
      append(p1, t3);
      append(div, t4);
      append(div, input);
      set_input_value(input, ctx[3]);
      append(div, t5);
      append(div, button);
      append(button, t6);
      append(div, t7);
      append(div, p2);
      append(p2, t8);
      append(div, t9);
      append(div, p3);
      append(p3, t10);
      if (!mounted) {
        dispose = [
          listen(input, "input", ctx[13]),
          listen(button, "click", ctx[9])
        ];
        mounted = true;
      }
    },
    p(ctx2, dirty) {
      var _a2, _b2, _c;
      if (dirty[0] & 64 && t0_value !== (t0_value = ((_a2 = ctx2[6]) == null ? void 0 : _a2.label) + ""))
        set_data(t0, t0_value);
      if (dirty[0] & 64 && !src_url_equal(img.src, img_src_value = "./miners/" + ((_b2 = ctx2[6]) == null ? void 0 : _b2.model) + ".png")) {
        attr(img, "src", img_src_value);
      }
      if (dirty[0] & 128 && t3_value !== (t3_value = ctx2[7]["Amount"] + ""))
        set_data(t3, t3_value);
      if (dirty[0] & 8 && to_number(input.value) !== ctx2[3]) {
        set_input_value(input, ctx2[3]);
      }
      if (dirty[0] & 128 && t6_value !== (t6_value = ctx2[7]["Order"] + ""))
        set_data(t6, t6_value);
      if (dirty[0] & 128 && t8_value !== (t8_value = ctx2[7]["Total"] + ""))
        set_data(t8, t8_value);
      if (dirty[0] & 72 && t10_value !== (t10_value = currency(ctx2[3] * ((_c = ctx2[6]) == null ? void 0 : _c.price) || 0) + ""))
        set_data(t10, t10_value);
    },
    d(detaching) {
      if (detaching)
        detach(div);
      mounted = false;
      run_all(dispose);
    }
  };
}
function create_each_block_2(ctx) {
  var _a;
  let input;
  let input_id_value;
  let t0;
  let div3;
  let div2;
  let label;
  let t1;
  let label_for_value;
  let t2;
  let h3;
  let t3_value = ((_a = ctx[27]) == null ? void 0 : _a.label) + "";
  let t3;
  let t4;
  let div1;
  let div0;
  let p;
  let t5;
  let span;
  let t6_value = ctx[27].data.hashrate + "";
  let t6;
  let t7;
  let t8;
  return {
    c() {
      input = element("input");
      t0 = space();
      div3 = element("div");
      div2 = element("div");
      label = element("label");
      t1 = text("\u2715");
      t2 = space();
      h3 = element("h3");
      t3 = text(t3_value);
      t4 = space();
      div1 = element("div");
      div0 = element("div");
      p = element("p");
      t5 = text("Hash Rate: ");
      span = element("span");
      t6 = text(t6_value);
      t7 = text("TH/s");
      t8 = space();
      attr(input, "type", "checkbox");
      attr(input, "id", input_id_value = ctx[21] + "-modal");
      attr(input, "class", "modal-toggle");
      attr(label, "for", label_for_value = ctx[21] + "-modal");
      attr(label, "class", "btn btn-sm btn-circle absolute right-2 top-2");
      attr(h3, "class", "text-2xl mb-2 font-bold text-center text-primary");
      attr(span, "class", "font-normal");
      attr(p, "class", "");
      attr(div0, "class", "p-5 bg-base-300 rounded-btn text-lg font-bold");
      attr(div1, "class", "flex flex-col gap-2");
      attr(div2, "class", "modal-box relative");
      attr(div3, "class", "modal");
    },
    m(target, anchor) {
      insert(target, input, anchor);
      insert(target, t0, anchor);
      insert(target, div3, anchor);
      append(div3, div2);
      append(div2, label);
      append(label, t1);
      append(div2, t2);
      append(div2, h3);
      append(h3, t3);
      append(div2, t4);
      append(div2, div1);
      append(div1, div0);
      append(div0, p);
      append(p, t5);
      append(p, span);
      append(span, t6);
      append(span, t7);
      append(div3, t8);
    },
    p(ctx2, dirty) {
      var _a2;
      if (dirty[0] & 2 && input_id_value !== (input_id_value = ctx2[21] + "-modal")) {
        attr(input, "id", input_id_value);
      }
      if (dirty[0] & 2 && label_for_value !== (label_for_value = ctx2[21] + "-modal")) {
        attr(label, "for", label_for_value);
      }
      if (dirty[0] & 2 && t3_value !== (t3_value = ((_a2 = ctx2[27]) == null ? void 0 : _a2.label) + ""))
        set_data(t3, t3_value);
      if (dirty[0] & 2 && t6_value !== (t6_value = ctx2[27].data.hashrate + ""))
        set_data(t6, t6_value);
    },
    d(detaching) {
      if (detaching)
        detach(input);
      if (detaching)
        detach(t0);
      if (detaching)
        detach(div3);
    }
  };
}
function create_if_block_1$4(ctx) {
  let button;
  let t_value = ctx[7]["PaidDelivery"] + "";
  let t;
  let mounted;
  let dispose;
  function click_handler_2() {
    return ctx[15](ctx[24]);
  }
  return {
    c() {
      button = element("button");
      t = text(t_value);
      button.disabled = ctx[2];
      attr(button, "class", "btn btn-secondary btn-sm");
    },
    m(target, anchor) {
      insert(target, button, anchor);
      append(button, t);
      if (!mounted) {
        dispose = listen(button, "click", click_handler_2);
        mounted = true;
      }
    },
    p(new_ctx, dirty) {
      ctx = new_ctx;
      if (dirty[0] & 128 && t_value !== (t_value = ctx[7]["PaidDelivery"] + ""))
        set_data(t, t_value);
      if (dirty[0] & 4) {
        button.disabled = ctx[2];
      }
    },
    d(detaching) {
      if (detaching)
        detach(button);
      mounted = false;
      dispose();
    }
  };
}
function create_each_block_1$1(key_1, ctx) {
  var _a, _b, _c;
  let div1;
  let div0;
  let p;
  let span;
  let t0_value = ctx[24].miner + "";
  let t0;
  let t1;
  let t2_value = ctx[24].amount + "";
  let t2;
  let t3;
  let button;
  let i;
  let t4;
  let t5_value = ctx[7]["PickUp"] + "";
  let t5;
  let t6;
  let t7;
  let mounted;
  let dispose;
  function click_handler_1() {
    return ctx[14](ctx[24]);
  }
  let if_block = ((_c = (_b = (_a = ctx[1]) == null ? void 0 : _a.Orders) == null ? void 0 : _b.InstantDelivery) == null ? void 0 : _c.enabled) && create_if_block_1$4(ctx);
  return {
    key: key_1,
    first: null,
    c() {
      div1 = element("div");
      div0 = element("div");
      p = element("p");
      span = element("span");
      t0 = text(t0_value);
      t1 = text(": ");
      t2 = text(t2_value);
      t3 = space();
      button = element("button");
      i = element("i");
      t4 = space();
      t5 = text(t5_value);
      t6 = space();
      if (if_block)
        if_block.c();
      t7 = space();
      attr(span, "class", "font-bold");
      attr(p, "class", "text-lg capitalize");
      attr(i, "class", "fa-solid fa-truck mr-2");
      button.disabled = ctx[2];
      attr(button, "class", "btn btn-primary btn-sm");
      attr(div0, "class", "p-5 flex items-center justify-between gap-5");
      attr(div1, "class", "card bg-base-300");
      this.first = div1;
    },
    m(target, anchor) {
      insert(target, div1, anchor);
      append(div1, div0);
      append(div0, p);
      append(p, span);
      append(span, t0);
      append(p, t1);
      append(p, t2);
      append(div0, t3);
      append(div0, button);
      append(button, i);
      append(button, t4);
      append(button, t5);
      append(div0, t6);
      if (if_block)
        if_block.m(div0, null);
      append(div1, t7);
      if (!mounted) {
        dispose = listen(button, "click", click_handler_1);
        mounted = true;
      }
    },
    p(new_ctx, dirty) {
      var _a2, _b2, _c2;
      ctx = new_ctx;
      if (dirty[0] & 16 && t0_value !== (t0_value = ctx[24].miner + ""))
        set_data(t0, t0_value);
      if (dirty[0] & 16 && t2_value !== (t2_value = ctx[24].amount + ""))
        set_data(t2, t2_value);
      if (dirty[0] & 128 && t5_value !== (t5_value = ctx[7]["PickUp"] + ""))
        set_data(t5, t5_value);
      if (dirty[0] & 4) {
        button.disabled = ctx[2];
      }
      if ((_c2 = (_b2 = (_a2 = ctx[1]) == null ? void 0 : _a2.Orders) == null ? void 0 : _b2.InstantDelivery) == null ? void 0 : _c2.enabled) {
        if (if_block) {
          if_block.p(ctx, dirty);
        } else {
          if_block = create_if_block_1$4(ctx);
          if_block.c();
          if_block.m(div0, null);
        }
      } else if (if_block) {
        if_block.d(1);
        if_block = null;
      }
    },
    d(detaching) {
      if (detaching)
        detach(div1);
      if (if_block)
        if_block.d();
      mounted = false;
      dispose();
    }
  };
}
function create_if_block$7(ctx) {
  var _a, _b, _c;
  let p;
  let span;
  let t0_value = ctx[7]["PaidDelivery"] + "";
  let t0;
  let t1;
  let t2;
  let t3_value = currency((_c = (_b = (_a = ctx[1]) == null ? void 0 : _a.Orders) == null ? void 0 : _b.InstantDelivery) == null ? void 0 : _c.price) + "";
  let t3;
  return {
    c() {
      p = element("p");
      span = element("span");
      t0 = text(t0_value);
      t1 = text(":");
      t2 = space();
      t3 = text(t3_value);
      attr(span, "class", "font-bold text-secondary");
      attr(p, "class", "text-center pt-2 text-lg");
    },
    m(target, anchor) {
      insert(target, p, anchor);
      append(p, span);
      append(span, t0);
      append(span, t1);
      append(p, t2);
      append(p, t3);
    },
    p(ctx2, dirty) {
      var _a2, _b2, _c2;
      if (dirty[0] & 128 && t0_value !== (t0_value = ctx2[7]["PaidDelivery"] + ""))
        set_data(t0, t0_value);
      if (dirty[0] & 2 && t3_value !== (t3_value = currency((_c2 = (_b2 = (_a2 = ctx2[1]) == null ? void 0 : _a2.Orders) == null ? void 0 : _b2.InstantDelivery) == null ? void 0 : _c2.price) + ""))
        set_data(t3, t3_value);
    },
    d(detaching) {
      if (detaching)
        detach(p);
    }
  };
}
function create_each_block$3(key_1, ctx) {
  let div1;
  let form;
  let p;
  let span;
  let t0_value = ctx[21] + "";
  let t0;
  let t1;
  let t2_value = ctx[5][ctx[21]] + "";
  let t2;
  let t3;
  let div0;
  let button0;
  let t5;
  let input;
  let input_id_value;
  let t6;
  let button1;
  let t8;
  let button2;
  let i;
  let t9;
  let t10_value = ctx[7]["Withdraw"] + "";
  let t10;
  let t11;
  let mounted;
  let dispose;
  function click_handler_3() {
    return ctx[16](ctx[21]);
  }
  function click_handler_4() {
    return ctx[17](ctx[21]);
  }
  function submit_handler(...args) {
    return ctx[18](ctx[21], ...args);
  }
  return {
    key: key_1,
    first: null,
    c() {
      div1 = element("div");
      form = element("form");
      p = element("p");
      span = element("span");
      t0 = text(t0_value);
      t1 = text(": ");
      t2 = text(t2_value);
      t3 = space();
      div0 = element("div");
      button0 = element("button");
      button0.textContent = "-";
      t5 = space();
      input = element("input");
      t6 = space();
      button1 = element("button");
      button1.textContent = "+";
      t8 = space();
      button2 = element("button");
      i = element("i");
      t9 = space();
      t10 = text(t10_value);
      t11 = space();
      attr(span, "class", "font-bold capitalize");
      attr(p, "class", "text-lg");
      attr(button0, "class", "btn btn-sm");
      attr(button0, "type", "button");
      attr(input, "id", input_id_value = "amount-" + ctx[21]);
      attr(input, "type", "number");
      attr(input, "min", "1");
      input.value = "1";
      attr(input, "placeholder", "10");
      attr(input, "class", "input input-bordered input-sm w-16");
      attr(button1, "class", "btn btn-sm");
      attr(button1, "type", "button");
      attr(div0, "class", "input-group input-group-sm w-fit");
      attr(i, "class", "fa-solid fa-hands-holding mr-2");
      attr(button2, "class", "btn btn-primary btn-sm");
      attr(form, "class", "p-5 flex items-center justify-between gap-5");
      attr(div1, "class", "card bg-base-300");
      this.first = div1;
    },
    m(target, anchor) {
      insert(target, div1, anchor);
      append(div1, form);
      append(form, p);
      append(p, span);
      append(span, t0);
      append(p, t1);
      append(p, t2);
      append(form, t3);
      append(form, div0);
      append(div0, button0);
      append(div0, t5);
      append(div0, input);
      append(div0, t6);
      append(div0, button1);
      append(form, t8);
      append(form, button2);
      append(button2, i);
      append(button2, t9);
      append(button2, t10);
      append(div1, t11);
      if (!mounted) {
        dispose = [
          listen(button0, "click", click_handler_3),
          listen(button1, "click", click_handler_4),
          listen(button2, "click", click_handler_5),
          listen(form, "submit", prevent_default(submit_handler))
        ];
        mounted = true;
      }
    },
    p(new_ctx, dirty) {
      ctx = new_ctx;
      if (dirty[0] & 32 && t0_value !== (t0_value = ctx[21] + ""))
        set_data(t0, t0_value);
      if (dirty[0] & 32 && t2_value !== (t2_value = ctx[5][ctx[21]] + ""))
        set_data(t2, t2_value);
      if (dirty[0] & 32 && input_id_value !== (input_id_value = "amount-" + ctx[21])) {
        attr(input, "id", input_id_value);
      }
      if (dirty[0] & 128 && t10_value !== (t10_value = ctx[7]["Withdraw"] + ""))
        set_data(t10, t10_value);
    },
    d(detaching) {
      if (detaching)
        detach(div1);
      mounted = false;
      run_all(dispose);
    }
  };
}
function create_fragment$7(ctx) {
  var _a, _b, _c;
  let main;
  let h30;
  let t0_value = ctx[7]["OrderMiners"] + "";
  let t0;
  let t1;
  let div0;
  let section0;
  let each_blocks_3 = [];
  let each0_lookup = /* @__PURE__ */ new Map();
  let t2;
  let section1;
  let h31;
  let show_if = Object.values(ctx[5]).length > 0;
  let t3;
  let t4;
  let main_intro;
  let t5;
  let t6;
  let input0;
  let t7;
  let div3;
  let div2;
  let label0;
  let t9;
  let h32;
  let t10_value = ctx[7]["Orders"] + "";
  let t10;
  let t11;
  let i0;
  let t12;
  let div1;
  let each_blocks_1 = [];
  let each2_lookup = /* @__PURE__ */ new Map();
  let t13;
  let t14;
  let input1;
  let t15;
  let div6;
  let div5;
  let label1;
  let t17;
  let h33;
  let t18_value = ctx[7]["Stock"] + "";
  let t18;
  let t19;
  let i1;
  let t20;
  let div4;
  let each_blocks = [];
  let each3_lookup = /* @__PURE__ */ new Map();
  let each_value_3 = Object.keys(ctx[1].MinerSettings);
  const get_key = (ctx2) => ctx2[21];
  for (let i = 0; i < each_value_3.length; i += 1) {
    let child_ctx = get_each_context_3(ctx, each_value_3, i);
    let key = get_key(child_ctx);
    each0_lookup.set(key, each_blocks_3[i] = create_each_block_3(key, child_ctx));
  }
  let if_block0 = show_if && create_if_block_4(ctx);
  let if_block1 = ctx[4].length > 0 && create_if_block_3$1(ctx);
  let if_block2 = ctx[0] && create_if_block_2$3(ctx);
  let each_value_2 = Object.keys(ctx[1].MinerSettings);
  let each_blocks_2 = [];
  for (let i = 0; i < each_value_2.length; i += 1) {
    each_blocks_2[i] = create_each_block_2(get_each_context_2(ctx, each_value_2, i));
  }
  let each_value_1 = ctx[4];
  const get_key_1 = (ctx2) => ctx2[24].id;
  for (let i = 0; i < each_value_1.length; i += 1) {
    let child_ctx = get_each_context_1$1(ctx, each_value_1, i);
    let key = get_key_1(child_ctx);
    each2_lookup.set(key, each_blocks_1[i] = create_each_block_1$1(key, child_ctx));
  }
  let if_block3 = ((_c = (_b = (_a = ctx[1]) == null ? void 0 : _a.Orders) == null ? void 0 : _b.InstantDelivery) == null ? void 0 : _c.enabled) && create_if_block$7(ctx);
  let each_value = Object.keys(ctx[5]);
  const get_key_2 = (ctx2) => ctx2[21];
  for (let i = 0; i < each_value.length; i += 1) {
    let child_ctx = get_each_context$3(ctx, each_value, i);
    let key = get_key_2(child_ctx);
    each3_lookup.set(key, each_blocks[i] = create_each_block$3(key, child_ctx));
  }
  return {
    c() {
      main = element("main");
      h30 = element("h3");
      t0 = text(t0_value);
      t1 = space();
      div0 = element("div");
      section0 = element("section");
      for (let i = 0; i < each_blocks_3.length; i += 1) {
        each_blocks_3[i].c();
      }
      t2 = space();
      section1 = element("section");
      h31 = element("h3");
      if (if_block0)
        if_block0.c();
      t3 = space();
      if (if_block1)
        if_block1.c();
      t4 = space();
      if (if_block2)
        if_block2.c();
      t5 = space();
      for (let i = 0; i < each_blocks_2.length; i += 1) {
        each_blocks_2[i].c();
      }
      t6 = space();
      input0 = element("input");
      t7 = space();
      div3 = element("div");
      div2 = element("div");
      label0 = element("label");
      label0.textContent = "\u2715";
      t9 = space();
      h32 = element("h3");
      t10 = text(t10_value);
      t11 = space();
      i0 = element("i");
      t12 = space();
      div1 = element("div");
      for (let i = 0; i < each_blocks_1.length; i += 1) {
        each_blocks_1[i].c();
      }
      t13 = space();
      if (if_block3)
        if_block3.c();
      t14 = space();
      input1 = element("input");
      t15 = space();
      div6 = element("div");
      div5 = element("div");
      label1 = element("label");
      label1.textContent = "\u2715";
      t17 = space();
      h33 = element("h3");
      t18 = text(t18_value);
      t19 = space();
      i1 = element("i");
      t20 = space();
      div4 = element("div");
      for (let i = 0; i < each_blocks.length; i += 1) {
        each_blocks[i].c();
      }
      attr(h30, "class", "text-2xl text-center font-bold pb-2 text-primary h-12 relative w-full flex items-center justify-center gap-2");
      attr(section0, "class", "grid basis-2/3 place-items-center content-start gap-5 grid-cols-3 overflow-y-auto px-5");
      attr(h31, "class", "font-bold text-xl h-12 w-full relative flex items-center justify-center mb-2");
      attr(section1, "class", "border-l-2 border-primary pl-2 flex-grow relative");
      attr(div0, "class", "flex flex-1 overflow-hidden");
      attr(main, "class", "p-5 w-full h-full flex flex-col text-base-content");
      attr(input0, "type", "checkbox");
      attr(input0, "id", "orders-modal");
      attr(input0, "class", "modal-toggle");
      attr(label0, "for", "orders-modal");
      attr(label0, "class", "btn btn-sm btn-circle absolute right-2 top-2");
      attr(i0, "class", "fa-solid fa-box text-lg");
      attr(h32, "class", "text-2xl mb-2 font-bold text-center text-primary");
      attr(div1, "class", "flex flex-col gap-2");
      attr(div2, "class", "modal-box relative max-w-fit w-full");
      attr(div3, "class", "modal");
      attr(input1, "type", "checkbox");
      attr(input1, "id", "stock-modal");
      attr(input1, "class", "modal-toggle");
      attr(label1, "for", "stock-modal");
      attr(label1, "class", "btn btn-sm btn-circle absolute right-2 top-2");
      attr(i1, "class", "fa-solid fa-sheet-plastic text-lg");
      attr(h33, "class", "text-2xl mb-2 font-bold text-center text-primary");
      attr(div4, "class", "flex flex-col");
      attr(div5, "class", "modal-box relative max-w-fit w-full");
      attr(div6, "class", "modal");
    },
    m(target, anchor) {
      insert(target, main, anchor);
      append(main, h30);
      append(h30, t0);
      append(main, t1);
      append(main, div0);
      append(div0, section0);
      for (let i = 0; i < each_blocks_3.length; i += 1) {
        each_blocks_3[i].m(section0, null);
      }
      append(div0, t2);
      append(div0, section1);
      append(section1, h31);
      if (if_block0)
        if_block0.m(h31, null);
      append(h31, t3);
      if (if_block1)
        if_block1.m(h31, null);
      append(section1, t4);
      if (if_block2)
        if_block2.m(section1, null);
      insert(target, t5, anchor);
      for (let i = 0; i < each_blocks_2.length; i += 1) {
        each_blocks_2[i].m(target, anchor);
      }
      insert(target, t6, anchor);
      insert(target, input0, anchor);
      insert(target, t7, anchor);
      insert(target, div3, anchor);
      append(div3, div2);
      append(div2, label0);
      append(div2, t9);
      append(div2, h32);
      append(h32, t10);
      append(h32, t11);
      append(h32, i0);
      append(div2, t12);
      append(div2, div1);
      for (let i = 0; i < each_blocks_1.length; i += 1) {
        each_blocks_1[i].m(div1, null);
      }
      append(div2, t13);
      if (if_block3)
        if_block3.m(div2, null);
      insert(target, t14, anchor);
      insert(target, input1, anchor);
      insert(target, t15, anchor);
      insert(target, div6, anchor);
      append(div6, div5);
      append(div5, label1);
      append(div5, t17);
      append(div5, h33);
      append(h33, t18);
      append(h33, t19);
      append(h33, i1);
      append(div5, t20);
      append(div5, div4);
      for (let i = 0; i < each_blocks.length; i += 1) {
        each_blocks[i].m(div4, null);
      }
    },
    p(ctx2, dirty) {
      var _a2, _b2, _c2;
      if (dirty[0] & 128 && t0_value !== (t0_value = ctx2[7]["OrderMiners"] + ""))
        set_data(t0, t0_value);
      if (dirty[0] & 3) {
        each_value_3 = Object.keys(ctx2[1].MinerSettings);
        each_blocks_3 = update_keyed_each(each_blocks_3, dirty, get_key, 1, ctx2, each_value_3, each0_lookup, section0, destroy_block, create_each_block_3, null, get_each_context_3);
      }
      if (dirty[0] & 32)
        show_if = Object.values(ctx2[5]).length > 0;
      if (show_if) {
        if (if_block0) {
          if_block0.p(ctx2, dirty);
        } else {
          if_block0 = create_if_block_4(ctx2);
          if_block0.c();
          if_block0.m(h31, t3);
        }
      } else if (if_block0) {
        if_block0.d(1);
        if_block0 = null;
      }
      if (ctx2[4].length > 0) {
        if (if_block1) {
          if_block1.p(ctx2, dirty);
        } else {
          if_block1 = create_if_block_3$1(ctx2);
          if_block1.c();
          if_block1.m(h31, null);
        }
      } else if (if_block1) {
        if_block1.d(1);
        if_block1 = null;
      }
      if (ctx2[0]) {
        if (if_block2) {
          if_block2.p(ctx2, dirty);
        } else {
          if_block2 = create_if_block_2$3(ctx2);
          if_block2.c();
          if_block2.m(section1, null);
        }
      } else if (if_block2) {
        if_block2.d(1);
        if_block2 = null;
      }
      if (dirty[0] & 2) {
        each_value_2 = Object.keys(ctx2[1].MinerSettings);
        let i;
        for (i = 0; i < each_value_2.length; i += 1) {
          const child_ctx = get_each_context_2(ctx2, each_value_2, i);
          if (each_blocks_2[i]) {
            each_blocks_2[i].p(child_ctx, dirty);
          } else {
            each_blocks_2[i] = create_each_block_2(child_ctx);
            each_blocks_2[i].c();
            each_blocks_2[i].m(t6.parentNode, t6);
          }
        }
        for (; i < each_blocks_2.length; i += 1) {
          each_blocks_2[i].d(1);
        }
        each_blocks_2.length = each_value_2.length;
      }
      if (dirty[0] & 128 && t10_value !== (t10_value = ctx2[7]["Orders"] + ""))
        set_data(t10, t10_value);
      if (dirty[0] & 1430) {
        each_value_1 = ctx2[4];
        each_blocks_1 = update_keyed_each(each_blocks_1, dirty, get_key_1, 1, ctx2, each_value_1, each2_lookup, div1, destroy_block, create_each_block_1$1, null, get_each_context_1$1);
      }
      if ((_c2 = (_b2 = (_a2 = ctx2[1]) == null ? void 0 : _a2.Orders) == null ? void 0 : _b2.InstantDelivery) == null ? void 0 : _c2.enabled) {
        if (if_block3) {
          if_block3.p(ctx2, dirty);
        } else {
          if_block3 = create_if_block$7(ctx2);
          if_block3.c();
          if_block3.m(div2, null);
        }
      } else if (if_block3) {
        if_block3.d(1);
        if_block3 = null;
      }
      if (dirty[0] & 128 && t18_value !== (t18_value = ctx2[7]["Stock"] + ""))
        set_data(t18, t18_value);
      if (dirty[0] & 2208) {
        each_value = Object.keys(ctx2[5]);
        each_blocks = update_keyed_each(each_blocks, dirty, get_key_2, 1, ctx2, each_value, each3_lookup, div4, destroy_block, create_each_block$3, null, get_each_context$3);
      }
    },
    i(local) {
      if (!main_intro) {
        add_render_callback(() => {
          main_intro = create_in_transition(main, fade, {});
          main_intro.start();
        });
      }
    },
    o: noop,
    d(detaching) {
      if (detaching)
        detach(main);
      for (let i = 0; i < each_blocks_3.length; i += 1) {
        each_blocks_3[i].d();
      }
      if (if_block0)
        if_block0.d();
      if (if_block1)
        if_block1.d();
      if (if_block2)
        if_block2.d();
      if (detaching)
        detach(t5);
      destroy_each(each_blocks_2, detaching);
      if (detaching)
        detach(t6);
      if (detaching)
        detach(input0);
      if (detaching)
        detach(t7);
      if (detaching)
        detach(div3);
      for (let i = 0; i < each_blocks_1.length; i += 1) {
        each_blocks_1[i].d();
      }
      if (if_block3)
        if_block3.d();
      if (detaching)
        detach(t14);
      if (detaching)
        detach(input1);
      if (detaching)
        detach(t15);
      if (detaching)
        detach(div6);
      for (let i = 0; i < each_blocks.length; i += 1) {
        each_blocks[i].d();
      }
    }
  };
}
function filterStock(stockData) {
  var _a;
  let tempStock = {};
  (_a = Object.keys(stockData || {})) == null ? void 0 : _a.forEach((k) => {
    if (stockData[k] > 0) {
      tempStock[k] = stockData[k];
    }
  });
  return tempStock;
}
function add(miner, stock) {
  const el = document.getElementById(`amount-${miner}`);
  if (el) {
    const newAmount = parseInt(el.value) + 1;
    if (newAmount > stock)
      return;
    el.value = newAmount;
  }
}
function remove(miner) {
  const el = document.getElementById(`amount-${miner}`);
  if (el) {
    const newAmount = parseInt(el.value) - 1;
    if (newAmount < 1)
      return;
    el.value = newAmount;
  }
}
const click_handler_5 = () => {
};
function instance$7($$self, $$props, $$invalidate) {
  let selectedMinerInfo;
  let $menu;
  let $Config;
  let $Locale;
  component_subscribe($$self, menu, ($$value) => $$invalidate(19, $menu = $$value));
  component_subscribe($$self, Config, ($$value) => $$invalidate(1, $Config = $$value));
  component_subscribe($$self, Locale, ($$value) => $$invalidate(7, $Locale = $$value));
  let isThinking = false;
  let amount = 1;
  let orders = [];
  let stock = {};
  let selectedMiner;
  function PickUpMiners(orderID) {
    Nui.send("PickUpMiners", orderID);
    set_store_value(menu, $menu = void 0, $menu);
  }
  async function OrderMiners() {
    if (!selectedMiner || !selectedMinerInfo || typeof amount !== "number" || amount <= 0) {
      return;
    }
    const result = await Nui.send("OrderMiners", { miner: selectedMiner, amount });
    const data = await result.json();
    if (data) {
      $$invalidate(4, orders = data);
    }
  }
  async function HomeDelivery(orderID) {
    $$invalidate(2, isThinking = true);
    const result = await Nui.send("HomeDelivery", orderID);
    const data = await result.json();
    if (data) {
      $$invalidate(4, orders = data.orders);
      $$invalidate(5, stock = filterStock(data.stock));
      if (orders.length === 0) {
        document.getElementById("orders-modal").click();
      }
    }
    $$invalidate(2, isThinking = false);
  }
  async function Withdraw(e, miner) {
    var _a;
    const el = await ((_a = e.target) == null ? void 0 : _a.querySelector("input"));
    const amount2 = el ? parseInt(el.value) : void 0;
    if (amount2 <= 0)
      return;
    const result = await Nui.send("WithdrawMiners", { miner, amount: amount2 });
    const data = await result.json();
    $$invalidate(5, stock = filterStock(data));
    if (Object.keys(stock).length === 0) {
      document.getElementById("stock-modal").click();
    }
  }
  async function getOrdersAndStock() {
    const result = await Nui.send("getOrdersAndStock");
    const data = await result.json();
    $$invalidate(4, orders = data.orders || []);
    $$invalidate(5, stock = filterStock(data.stock));
  }
  onMount(() => {
    getOrdersAndStock();
  });
  const click_handler = (miner) => $$invalidate(0, selectedMiner = miner);
  function input_input_handler() {
    amount = to_number(this.value);
    $$invalidate(3, amount);
  }
  const click_handler_1 = (order) => PickUpMiners(order.id);
  const click_handler_2 = (order) => HomeDelivery(order.id);
  const click_handler_3 = (miner) => remove(miner);
  const click_handler_4 = (miner) => add(miner, stock[miner]);
  const submit_handler = (miner, e) => Withdraw(e, miner);
  $$self.$$.update = () => {
    var _a;
    if ($$self.$$.dirty[0] & 3) {
      $$invalidate(6, selectedMinerInfo = (_a = $Config == null ? void 0 : $Config.MinerSettings) == null ? void 0 : _a[selectedMiner]);
    }
  };
  return [
    selectedMiner,
    $Config,
    isThinking,
    amount,
    orders,
    stock,
    selectedMinerInfo,
    $Locale,
    PickUpMiners,
    OrderMiners,
    HomeDelivery,
    Withdraw,
    click_handler,
    input_input_handler,
    click_handler_1,
    click_handler_2,
    click_handler_3,
    click_handler_4,
    submit_handler
  ];
}
class Order extends SvelteComponent {
  constructor(options) {
    super();
    init(this, options, instance$7, create_fragment$7, safe_not_equal, {}, null, [-1, -1]);
  }
}
function create_else_block$3(ctx) {
  let div;
  let p;
  let t_value = ctx[1]["NoBillsToPay"] + "";
  let t;
  return {
    c() {
      div = element("div");
      p = element("p");
      t = text(t_value);
      attr(p, "class", "text-center text-3xl font-bold p-5");
      attr(div, "class", "p-2 rounded-box bg-base-300");
    },
    m(target, anchor) {
      insert(target, div, anchor);
      append(div, p);
      append(p, t);
    },
    p(ctx2, dirty) {
      if (dirty & 2 && t_value !== (t_value = ctx2[1]["NoBillsToPay"] + ""))
        set_data(t, t_value);
    },
    d(detaching) {
      if (detaching)
        detach(div);
    }
  };
}
function create_if_block$6(ctx) {
  let div;
  let p0;
  let t0_value = ctx[1]["PowerBill"] + "";
  let t0;
  let t1;
  let p1;
  let t2_value = ctx[1]["AmountDue"] + "";
  let t2;
  let t3;
  let t4_value = currency(ctx[0]) + "";
  let t4;
  let t5;
  let button;
  let t6_value = ctx[1]["Pay"] + "";
  let t6;
  let t7;
  let p2;
  let t8_value = ctx[1]["YouCantMineWithouPayingBill"] + "";
  let t8;
  let mounted;
  let dispose;
  return {
    c() {
      div = element("div");
      p0 = element("p");
      t0 = text(t0_value);
      t1 = space();
      p1 = element("p");
      t2 = text(t2_value);
      t3 = text(": ");
      t4 = text(t4_value);
      t5 = space();
      button = element("button");
      t6 = text(t6_value);
      t7 = space();
      p2 = element("p");
      t8 = text(t8_value);
      attr(p0, "class", "text-3xl font-bold");
      attr(p1, "class", "text-xl my-2");
      attr(button, "class", "btn btn-primary w-1/3");
      attr(p2, "class", "italic pt-5");
      attr(div, "class", "p-2 rounded-box bg-base-300 text-center");
    },
    m(target, anchor) {
      insert(target, div, anchor);
      append(div, p0);
      append(p0, t0);
      append(div, t1);
      append(div, p1);
      append(p1, t2);
      append(p1, t3);
      append(p1, t4);
      append(div, t5);
      append(div, button);
      append(button, t6);
      append(div, t7);
      append(div, p2);
      append(p2, t8);
      if (!mounted) {
        dispose = listen(button, "click", ctx[2]);
        mounted = true;
      }
    },
    p(ctx2, dirty) {
      if (dirty & 2 && t0_value !== (t0_value = ctx2[1]["PowerBill"] + ""))
        set_data(t0, t0_value);
      if (dirty & 2 && t2_value !== (t2_value = ctx2[1]["AmountDue"] + ""))
        set_data(t2, t2_value);
      if (dirty & 1 && t4_value !== (t4_value = currency(ctx2[0]) + ""))
        set_data(t4, t4_value);
      if (dirty & 2 && t6_value !== (t6_value = ctx2[1]["Pay"] + ""))
        set_data(t6, t6_value);
      if (dirty & 2 && t8_value !== (t8_value = ctx2[1]["YouCantMineWithouPayingBill"] + ""))
        set_data(t8, t8_value);
    },
    d(detaching) {
      if (detaching)
        detach(div);
      mounted = false;
      dispose();
    }
  };
}
function create_fragment$6(ctx) {
  let main;
  function select_block_type(ctx2, dirty) {
    if (ctx2[0] > 0)
      return create_if_block$6;
    return create_else_block$3;
  }
  let current_block_type = select_block_type(ctx);
  let if_block = current_block_type(ctx);
  return {
    c() {
      main = element("main");
      if_block.c();
      attr(main, "class", "w-full card-body");
    },
    m(target, anchor) {
      insert(target, main, anchor);
      if_block.m(main, null);
    },
    p(ctx2, [dirty]) {
      if (current_block_type === (current_block_type = select_block_type(ctx2)) && if_block) {
        if_block.p(ctx2, dirty);
      } else {
        if_block.d(1);
        if_block = current_block_type(ctx2);
        if (if_block) {
          if_block.c();
          if_block.m(main, null);
        }
      }
    },
    i: noop,
    o: noop,
    d(detaching) {
      if (detaching)
        detach(main);
      if_block.d();
    }
  };
}
function instance$6($$self, $$props, $$invalidate) {
  let $Locale;
  component_subscribe($$self, Locale, ($$value) => $$invalidate(1, $Locale = $$value));
  let powerBill2 = 0;
  async function GetPowerBills() {
    const result = await Nui.send("GetPowerBills");
    const data = await result.json();
    if (data) {
      $$invalidate(0, powerBill2 = data);
    }
  }
  async function PayPowerBills() {
    const result = await Nui.send("PayPowerBills");
    const data = await result.json();
    if (data) {
      $$invalidate(0, powerBill2 = 0);
    }
  }
  GetPowerBills();
  return [powerBill2, $Locale, PayPowerBills];
}
class Power extends SvelteComponent {
  constructor(options) {
    super();
    init(this, options, instance$6, create_fragment$6, safe_not_equal, {});
  }
}
function get_each_context$2(ctx, list, i) {
  const child_ctx = ctx.slice();
  child_ctx[10] = list[i];
  return child_ctx;
}
function create_else_block$2(ctx) {
  let p;
  let t_value = ctx[2]["NoGuestsFound"] + "";
  let t;
  return {
    c() {
      p = element("p");
      t = text(t_value);
      attr(p, "class", "text-xl");
    },
    m(target, anchor) {
      insert(target, p, anchor);
      append(p, t);
    },
    p(ctx2, dirty) {
      if (dirty & 4 && t_value !== (t_value = ctx2[2]["NoGuestsFound"] + ""))
        set_data(t, t_value);
    },
    d(detaching) {
      if (detaching)
        detach(p);
    }
  };
}
function create_if_block$5(ctx) {
  let each_1_anchor;
  let each_value = ctx[0];
  let each_blocks = [];
  for (let i = 0; i < each_value.length; i += 1) {
    each_blocks[i] = create_each_block$2(get_each_context$2(ctx, each_value, i));
  }
  return {
    c() {
      for (let i = 0; i < each_blocks.length; i += 1) {
        each_blocks[i].c();
      }
      each_1_anchor = empty();
    },
    m(target, anchor) {
      for (let i = 0; i < each_blocks.length; i += 1) {
        each_blocks[i].m(target, anchor);
      }
      insert(target, each_1_anchor, anchor);
    },
    p(ctx2, dirty) {
      if (dirty & 21) {
        each_value = ctx2[0];
        let i;
        for (i = 0; i < each_value.length; i += 1) {
          const child_ctx = get_each_context$2(ctx2, each_value, i);
          if (each_blocks[i]) {
            each_blocks[i].p(child_ctx, dirty);
          } else {
            each_blocks[i] = create_each_block$2(child_ctx);
            each_blocks[i].c();
            each_blocks[i].m(each_1_anchor.parentNode, each_1_anchor);
          }
        }
        for (; i < each_blocks.length; i += 1) {
          each_blocks[i].d(1);
        }
        each_blocks.length = each_value.length;
      }
    },
    d(detaching) {
      destroy_each(each_blocks, detaching);
      if (detaching)
        detach(each_1_anchor);
    }
  };
}
function create_each_block$2(ctx) {
  let div;
  let p;
  let t0_value = ctx[10].name + "";
  let t0;
  let t1;
  let button;
  let t2_value = ctx[2]["Remove"] + "";
  let t2;
  let t3;
  let mounted;
  let dispose;
  function click_handler() {
    return ctx[6](ctx[10]);
  }
  return {
    c() {
      div = element("div");
      p = element("p");
      t0 = text(t0_value);
      t1 = space();
      button = element("button");
      t2 = text(t2_value);
      t3 = space();
      attr(p, "class", "text-xl");
      attr(button, "class", "btn btn-error");
      attr(div, "class", "grid grid-cols-2 place-items-center text-start bg-base-300 p-2 rounded-box");
    },
    m(target, anchor) {
      insert(target, div, anchor);
      append(div, p);
      append(p, t0);
      append(div, t1);
      append(div, button);
      append(button, t2);
      append(div, t3);
      if (!mounted) {
        dispose = listen(button, "click", click_handler);
        mounted = true;
      }
    },
    p(new_ctx, dirty) {
      ctx = new_ctx;
      if (dirty & 1 && t0_value !== (t0_value = ctx[10].name + ""))
        set_data(t0, t0_value);
      if (dirty & 4 && t2_value !== (t2_value = ctx[2]["Remove"] + ""))
        set_data(t2, t2_value);
    },
    d(detaching) {
      if (detaching)
        detach(div);
      mounted = false;
      dispose();
    }
  };
}
function create_fragment$5(ctx) {
  let main;
  let div0;
  let h1;
  let t0_value = ctx[2]["Warehouse"] + "";
  let t0;
  let t1;
  let i0;
  let t2;
  let p0;
  let t3_value = ctx[2]["Menu"] + "";
  let t3;
  let t4;
  let div2;
  let p1;
  let t5_value = ctx[2]["AddANewGuest"] + "";
  let t5;
  let t6;
  let div1;
  let form;
  let input0;
  let t7;
  let button;
  let t8_value = ctx[2]["Add"] + "";
  let t8;
  let t9;
  let p2;
  let t10_value = ctx[2]["RemoveGuests"] + "";
  let t10;
  let t11;
  let label0;
  let t12_value = ctx[2]["ShowGuests"] + "";
  let t12;
  let t13;
  let div3;
  let a;
  let i1;
  let t14;
  let p3;
  let t15_value = ctx[2]["GoBack"] + "";
  let t15;
  let t16;
  let input1;
  let t17;
  let div6;
  let div5;
  let label1;
  let t19;
  let h3;
  let t20_value = ctx[2]["AllGuests"] + "";
  let t20;
  let t21;
  let div4;
  let mounted;
  let dispose;
  function select_block_type(ctx2, dirty) {
    if (ctx2[0].length > 0)
      return create_if_block$5;
    return create_else_block$2;
  }
  let current_block_type = select_block_type(ctx);
  let if_block = current_block_type(ctx);
  return {
    c() {
      main = element("main");
      div0 = element("div");
      h1 = element("h1");
      t0 = text(t0_value);
      t1 = space();
      i0 = element("i");
      t2 = space();
      p0 = element("p");
      t3 = text(t3_value);
      t4 = space();
      div2 = element("div");
      p1 = element("p");
      t5 = text(t5_value);
      t6 = space();
      div1 = element("div");
      form = element("form");
      input0 = element("input");
      t7 = space();
      button = element("button");
      t8 = text(t8_value);
      t9 = space();
      p2 = element("p");
      t10 = text(t10_value);
      t11 = space();
      label0 = element("label");
      t12 = text(t12_value);
      t13 = space();
      div3 = element("div");
      a = element("a");
      i1 = element("i");
      t14 = space();
      p3 = element("p");
      t15 = text(t15_value);
      t16 = space();
      input1 = element("input");
      t17 = space();
      div6 = element("div");
      div5 = element("div");
      label1 = element("label");
      label1.textContent = "\u2715";
      t19 = space();
      h3 = element("h3");
      t20 = text(t20_value);
      t21 = space();
      div4 = element("div");
      if_block.c();
      attr(i0, "class", "fa-solid fa-warehouse text-2xl");
      attr(h1, "class", "font-bold text-3xl text-primary");
      attr(p0, "class", "font-bold text-2xl base-content");
      attr(div0, "class", "w-full flex flex-col p-5 bg-base-300 text-center");
      attr(p1, "class", "text-xl text-base-content");
      attr(input0, "type", "number");
      attr(input0, "placeholder", "Player ID");
      attr(input0, "class", "input input-bordered input-primary focus:outline-none");
      attr(button, "class", "btn btn-primary btn-square");
      attr(form, "class", "input-group");
      attr(div1, "class", "form-control");
      attr(p2, "class", "text-xl text-base-content");
      attr(label0, "for", "ShowGuests");
      attr(label0, "class", "btn btn-info modal-button flex-grow font-bold");
      attr(div2, "class", "flex items-center flex-col gap-2 w-full h-full p-5");
      attr(i1, "class", "fas fa-angle-double-left");
      attr(a, "href", "#/exit");
      attr(a, "class", "btn btn-primary flex-grow flex gap-2 flex-row");
      attr(div3, "class", "w-full flex flex-col p-5 bg-base-300 text-center");
      attr(main, "class", "h-fit flex flex-col items-center justify-start");
      attr(input1, "type", "checkbox");
      attr(input1, "id", "ShowGuests");
      attr(input1, "class", "modal-toggle");
      attr(label1, "for", "ShowGuests");
      attr(label1, "class", "btn btn-sm btn-circle absolute right-2 top-2");
      attr(h3, "class", "text-3xl font-bold text-info text-center");
      attr(div4, "class", "modal-action flex-col gap-2 items-center justify-center bg-base-200 rounded-box p-2");
      attr(div5, "class", "modal-box text-center");
      attr(div6, "class", "modal");
    },
    m(target, anchor) {
      insert(target, main, anchor);
      append(main, div0);
      append(div0, h1);
      append(h1, t0);
      append(h1, t1);
      append(h1, i0);
      append(div0, t2);
      append(div0, p0);
      append(p0, t3);
      append(main, t4);
      append(main, div2);
      append(div2, p1);
      append(p1, t5);
      append(div2, t6);
      append(div2, div1);
      append(div1, form);
      append(form, input0);
      set_input_value(input0, ctx[1]);
      append(form, t7);
      append(form, button);
      append(button, t8);
      append(div2, t9);
      append(div2, p2);
      append(p2, t10);
      append(div2, t11);
      append(div2, label0);
      append(label0, t12);
      append(main, t13);
      append(main, div3);
      append(div3, a);
      append(a, i1);
      append(a, t14);
      append(a, p3);
      append(p3, t15);
      insert(target, t16, anchor);
      insert(target, input1, anchor);
      insert(target, t17, anchor);
      insert(target, div6, anchor);
      append(div6, div5);
      append(div5, label1);
      append(div5, t19);
      append(div5, h3);
      append(h3, t20);
      append(div5, t21);
      append(div5, div4);
      if_block.m(div4, null);
      if (!mounted) {
        dispose = [
          listen(input0, "input", ctx[5]),
          listen(form, "submit", prevent_default(ctx[3]))
        ];
        mounted = true;
      }
    },
    p(ctx2, [dirty]) {
      if (dirty & 4 && t0_value !== (t0_value = ctx2[2]["Warehouse"] + ""))
        set_data(t0, t0_value);
      if (dirty & 4 && t3_value !== (t3_value = ctx2[2]["Menu"] + ""))
        set_data(t3, t3_value);
      if (dirty & 4 && t5_value !== (t5_value = ctx2[2]["AddANewGuest"] + ""))
        set_data(t5, t5_value);
      if (dirty & 2 && to_number(input0.value) !== ctx2[1]) {
        set_input_value(input0, ctx2[1]);
      }
      if (dirty & 4 && t8_value !== (t8_value = ctx2[2]["Add"] + ""))
        set_data(t8, t8_value);
      if (dirty & 4 && t10_value !== (t10_value = ctx2[2]["RemoveGuests"] + ""))
        set_data(t10, t10_value);
      if (dirty & 4 && t12_value !== (t12_value = ctx2[2]["ShowGuests"] + ""))
        set_data(t12, t12_value);
      if (dirty & 4 && t15_value !== (t15_value = ctx2[2]["GoBack"] + ""))
        set_data(t15, t15_value);
      if (dirty & 4 && t20_value !== (t20_value = ctx2[2]["AllGuests"] + ""))
        set_data(t20, t20_value);
      if (current_block_type === (current_block_type = select_block_type(ctx2)) && if_block) {
        if_block.p(ctx2, dirty);
      } else {
        if_block.d(1);
        if_block = current_block_type(ctx2);
        if (if_block) {
          if_block.c();
          if_block.m(div4, null);
        }
      }
    },
    i: noop,
    o: noop,
    d(detaching) {
      if (detaching)
        detach(main);
      if (detaching)
        detach(t16);
      if (detaching)
        detach(input1);
      if (detaching)
        detach(t17);
      if (detaching)
        detach(div6);
      if_block.d();
      mounted = false;
      run_all(dispose);
    }
  };
}
function instance$5($$self, $$props, $$invalidate) {
  let $Locale;
  component_subscribe($$self, Locale, ($$value) => $$invalidate(2, $Locale = $$value));
  let [employees, jobapplications, guests] = [[], [], []];
  async function GetWorkersAndGuests() {
    const result = await Nui.send("GetWorkersAndGuests");
    const data = await result.json();
    employees = data.workers;
    jobapplications = data.jobapplications;
    $$invalidate(0, guests = data.guests);
  }
  GetWorkersAndGuests();
  let playerID;
  function AddGuest() {
    if (playerID && Number(playerID)) {
      Nui.send("AddGuest", Number(playerID));
    }
  }
  function RemoveGuest(identifier) {
    Nui.send("RemoveGuest", identifier);
    $$invalidate(0, guests = guests.filter((e) => e.identifier !== identifier));
  }
  function input0_input_handler() {
    playerID = to_number(this.value);
    $$invalidate(1, playerID);
  }
  const click_handler = (guest) => RemoveGuest(guest.identifier);
  return [
    guests,
    playerID,
    $Locale,
    AddGuest,
    RemoveGuest,
    input0_input_handler,
    click_handler
  ];
}
class Guests extends SvelteComponent {
  constructor(options) {
    super();
    init(this, options, instance$5, create_fragment$5, safe_not_equal, {});
  }
}
function get_each_context$1(ctx, list, i) {
  const child_ctx = ctx.slice();
  child_ctx[8] = list[i];
  child_ctx[9] = list;
  child_ctx[10] = i;
  return child_ctx;
}
function create_else_block$1(ctx) {
  let div;
  let each_value = ctx[1];
  let each_blocks = [];
  for (let i = 0; i < each_value.length; i += 1) {
    each_blocks[i] = create_each_block$1(get_each_context$1(ctx, each_value, i));
  }
  return {
    c() {
      div = element("div");
      for (let i = 0; i < each_blocks.length; i += 1) {
        each_blocks[i].c();
      }
      attr(div, "class", "flex flex-col flex-1 gap-5");
    },
    m(target, anchor) {
      insert(target, div, anchor);
      for (let i = 0; i < each_blocks.length; i += 1) {
        each_blocks[i].m(div, null);
      }
    },
    p(ctx2, dirty) {
      if (dirty & 10) {
        each_value = ctx2[1];
        let i;
        for (i = 0; i < each_value.length; i += 1) {
          const child_ctx = get_each_context$1(ctx2, each_value, i);
          if (each_blocks[i]) {
            each_blocks[i].p(child_ctx, dirty);
          } else {
            each_blocks[i] = create_each_block$1(child_ctx);
            each_blocks[i].c();
            each_blocks[i].m(div, null);
          }
        }
        for (; i < each_blocks.length; i += 1) {
          each_blocks[i].d(1);
        }
        each_blocks.length = each_value.length;
      }
    },
    d(detaching) {
      if (detaching)
        detach(div);
      destroy_each(each_blocks, detaching);
    }
  };
}
function create_if_block$4(ctx) {
  let p;
  let t_value = ctx[3]["NoEmployees"] + "";
  let t;
  return {
    c() {
      p = element("p");
      t = text(t_value);
      attr(p, "class", "text-center text-xl font-bold text-primary");
    },
    m(target, anchor) {
      insert(target, p, anchor);
      append(p, t);
    },
    p(ctx2, dirty) {
      if (dirty & 8 && t_value !== (t_value = ctx2[3]["NoEmployees"] + ""))
        set_data(t, t_value);
    },
    d(detaching) {
      if (detaching)
        detach(p);
    }
  };
}
function create_each_block$1(ctx) {
  let div;
  let p0;
  let t0_value = ctx[3]["Name"] + "";
  let t0;
  let t1;
  let span0;
  let t2_value = ctx[8].name + "";
  let t2;
  let t3;
  let p1;
  let t4_value = ctx[3]["Percentage"] + "";
  let t4;
  let t5;
  let span1;
  let t6_value = ctx[8].payment_shares * 100 + "";
  let t6;
  let t7;
  let t8;
  let input;
  let t9;
  let mounted;
  let dispose;
  function input_input_handler_1() {
    ctx[6].call(input, ctx[9], ctx[10]);
  }
  return {
    c() {
      div = element("div");
      p0 = element("p");
      t0 = text(t0_value);
      t1 = text(":\r\n              ");
      span0 = element("span");
      t2 = text(t2_value);
      t3 = space();
      p1 = element("p");
      t4 = text(t4_value);
      t5 = text(":\r\n              ");
      span1 = element("span");
      t6 = text(t6_value);
      t7 = text("%");
      t8 = space();
      input = element("input");
      t9 = space();
      attr(span0, "class", "capitalize text-base-content");
      attr(p0, "class", "text-primary");
      attr(span1, "class", "text-base-content");
      attr(p1, "class", "text-primary");
      attr(input, "type", "number");
      attr(input, "min", "0");
      attr(input, "max", "1");
      attr(input, "step", "0.01");
      attr(input, "class", "input input-primary");
      attr(div, "class", "bg-base-100 rounded-box w-full card-body p-5");
    },
    m(target, anchor) {
      insert(target, div, anchor);
      append(div, p0);
      append(p0, t0);
      append(p0, t1);
      append(p0, span0);
      append(span0, t2);
      append(div, t3);
      append(div, p1);
      append(p1, t4);
      append(p1, t5);
      append(p1, span1);
      append(span1, t6);
      append(span1, t7);
      append(div, t8);
      append(div, input);
      set_input_value(input, ctx[8].payment_shares);
      append(div, t9);
      if (!mounted) {
        dispose = listen(input, "input", input_input_handler_1);
        mounted = true;
      }
    },
    p(new_ctx, dirty) {
      ctx = new_ctx;
      if (dirty & 8 && t0_value !== (t0_value = ctx[3]["Name"] + ""))
        set_data(t0, t0_value);
      if (dirty & 2 && t2_value !== (t2_value = ctx[8].name + ""))
        set_data(t2, t2_value);
      if (dirty & 8 && t4_value !== (t4_value = ctx[3]["Percentage"] + ""))
        set_data(t4, t4_value);
      if (dirty & 2 && t6_value !== (t6_value = ctx[8].payment_shares * 100 + ""))
        set_data(t6, t6_value);
      if (dirty & 2 && to_number(input.value) !== ctx[8].payment_shares) {
        set_input_value(input, ctx[8].payment_shares);
      }
    },
    d(detaching) {
      if (detaching)
        detach(div);
      mounted = false;
      dispose();
    }
  };
}
function create_fragment$4(ctx) {
  let main;
  let p0;
  let t0_value = ctx[3]["Payments"] + "";
  let t0;
  let t1;
  let p1;
  let t2_value = ctx[3]["MiningRewardsSplit"] + "";
  let t2;
  let t3;
  let div1;
  let p2;
  let t4_value = ctx[3]["Owner"] + "";
  let t4;
  let t5;
  let div0;
  let p3;
  let t6_value = ctx[3]["Name"] + "";
  let t6;
  let t7;
  let span0;
  let t8_value = ctx[0].name + "";
  let t8;
  let t9;
  let p4;
  let t10_value = ctx[3]["Percentage"] + "";
  let t10;
  let t11;
  let span1;
  let t12_value = ctx[0].payment_shares * 100 + "";
  let t12;
  let t13;
  let t14;
  let input;
  let t15;
  let p5;
  let t16_value = ctx[3]["Employees"] + "";
  let t16;
  let t17;
  let t18;
  let div2;
  let p6;
  let t19_value = ctx[3]["Total"] + "";
  let t19;
  let t20;
  let t21_value = ctx[2]() * 100 + "";
  let t21;
  let t22;
  let span2;
  let t23_value = ctx[3]["MustEqualToHundred"] + "";
  let t23;
  let t24;
  let button;
  let t25_value = ctx[3]["Apply"] + "";
  let t25;
  let button_disabled_value;
  let mounted;
  let dispose;
  function select_block_type(ctx2, dirty) {
    if (ctx2[1].length === 0)
      return create_if_block$4;
    return create_else_block$1;
  }
  let current_block_type = select_block_type(ctx);
  let if_block = current_block_type(ctx);
  return {
    c() {
      main = element("main");
      p0 = element("p");
      t0 = text(t0_value);
      t1 = space();
      p1 = element("p");
      t2 = text(t2_value);
      t3 = space();
      div1 = element("div");
      p2 = element("p");
      t4 = text(t4_value);
      t5 = space();
      div0 = element("div");
      p3 = element("p");
      t6 = text(t6_value);
      t7 = text(":\r\n        ");
      span0 = element("span");
      t8 = text(t8_value);
      t9 = space();
      p4 = element("p");
      t10 = text(t10_value);
      t11 = text(":\r\n        ");
      span1 = element("span");
      t12 = text(t12_value);
      t13 = text("%");
      t14 = space();
      input = element("input");
      t15 = space();
      p5 = element("p");
      t16 = text(t16_value);
      t17 = space();
      if_block.c();
      t18 = space();
      div2 = element("div");
      p6 = element("p");
      t19 = text(t19_value);
      t20 = text(": ");
      t21 = text(t21_value);
      t22 = text("%\r\n    ");
      span2 = element("span");
      t23 = text(t23_value);
      t24 = space();
      button = element("button");
      t25 = text(t25_value);
      attr(p0, "class", "text-center text-3xl font-bold");
      attr(p1, "class", "text-center text-xl font-bold");
      attr(p2, "class", "text-2xl text-left font-bold text-primary");
      attr(span0, "class", "capitalize text-base-content");
      attr(p3, "class", "text-primary");
      attr(span1, "class", "text-base-content");
      attr(p4, "class", "text-primary");
      attr(input, "type", "number");
      attr(input, "min", "0");
      attr(input, "max", "1");
      attr(input, "step", "0.01");
      attr(input, "class", "input input-primary");
      attr(div0, "class", "bg-base-100 rounded-box w-full card-body p-5");
      attr(p5, "class", "text-2xl text-left font-bold text-secondary");
      attr(div1, "class", "p-5 rounded-box bg-base-300 flex flex-col gap-2 flex-1 relative w-full h-full");
      attr(main, "class", "w-full card-body relative mb-16 font-bold");
      attr(span2, "class", "italic text-primary");
      button.disabled = button_disabled_value = ctx[2]() !== 1;
      attr(button, "class", "btn btn-primary");
      attr(div2, "class", "flex items-center justify-between absolute z-50 bottom-0 w-full p-5 bg-base-300");
    },
    m(target, anchor) {
      insert(target, main, anchor);
      append(main, p0);
      append(p0, t0);
      append(main, t1);
      append(main, p1);
      append(p1, t2);
      append(main, t3);
      append(main, div1);
      append(div1, p2);
      append(p2, t4);
      append(div1, t5);
      append(div1, div0);
      append(div0, p3);
      append(p3, t6);
      append(p3, t7);
      append(p3, span0);
      append(span0, t8);
      append(div0, t9);
      append(div0, p4);
      append(p4, t10);
      append(p4, t11);
      append(p4, span1);
      append(span1, t12);
      append(span1, t13);
      append(div0, t14);
      append(div0, input);
      set_input_value(input, ctx[0].payment_shares);
      append(div1, t15);
      append(div1, p5);
      append(p5, t16);
      append(div1, t17);
      if_block.m(div1, null);
      insert(target, t18, anchor);
      insert(target, div2, anchor);
      append(div2, p6);
      append(p6, t19);
      append(p6, t20);
      append(p6, t21);
      append(p6, t22);
      append(p6, span2);
      append(span2, t23);
      append(div2, t24);
      append(div2, button);
      append(button, t25);
      if (!mounted) {
        dispose = [
          listen(input, "input", ctx[5]),
          listen(button, "click", ctx[4])
        ];
        mounted = true;
      }
    },
    p(ctx2, [dirty]) {
      if (dirty & 8 && t0_value !== (t0_value = ctx2[3]["Payments"] + ""))
        set_data(t0, t0_value);
      if (dirty & 8 && t2_value !== (t2_value = ctx2[3]["MiningRewardsSplit"] + ""))
        set_data(t2, t2_value);
      if (dirty & 8 && t4_value !== (t4_value = ctx2[3]["Owner"] + ""))
        set_data(t4, t4_value);
      if (dirty & 8 && t6_value !== (t6_value = ctx2[3]["Name"] + ""))
        set_data(t6, t6_value);
      if (dirty & 1 && t8_value !== (t8_value = ctx2[0].name + ""))
        set_data(t8, t8_value);
      if (dirty & 8 && t10_value !== (t10_value = ctx2[3]["Percentage"] + ""))
        set_data(t10, t10_value);
      if (dirty & 1 && t12_value !== (t12_value = ctx2[0].payment_shares * 100 + ""))
        set_data(t12, t12_value);
      if (dirty & 1 && to_number(input.value) !== ctx2[0].payment_shares) {
        set_input_value(input, ctx2[0].payment_shares);
      }
      if (dirty & 8 && t16_value !== (t16_value = ctx2[3]["Employees"] + ""))
        set_data(t16, t16_value);
      if (current_block_type === (current_block_type = select_block_type(ctx2)) && if_block) {
        if_block.p(ctx2, dirty);
      } else {
        if_block.d(1);
        if_block = current_block_type(ctx2);
        if (if_block) {
          if_block.c();
          if_block.m(div1, null);
        }
      }
      if (dirty & 8 && t19_value !== (t19_value = ctx2[3]["Total"] + ""))
        set_data(t19, t19_value);
      if (dirty & 4 && t21_value !== (t21_value = ctx2[2]() * 100 + ""))
        set_data(t21, t21_value);
      if (dirty & 8 && t23_value !== (t23_value = ctx2[3]["MustEqualToHundred"] + ""))
        set_data(t23, t23_value);
      if (dirty & 8 && t25_value !== (t25_value = ctx2[3]["Apply"] + ""))
        set_data(t25, t25_value);
      if (dirty & 4 && button_disabled_value !== (button_disabled_value = ctx2[2]() !== 1)) {
        button.disabled = button_disabled_value;
      }
    },
    i: noop,
    o: noop,
    d(detaching) {
      if (detaching)
        detach(main);
      if_block.d();
      if (detaching)
        detach(t18);
      if (detaching)
        detach(div2);
      mounted = false;
      run_all(dispose);
    }
  };
}
function instance$4($$self, $$props, $$invalidate) {
  let totalamount;
  let $workers;
  let $Locale;
  component_subscribe($$self, workers, ($$value) => $$invalidate(7, $workers = $$value));
  component_subscribe($$self, Locale, ($$value) => $$invalidate(3, $Locale = $$value));
  let owner = $workers.find((w) => w.rank === "owner");
  let employees = $workers.filter((w) => w.rank !== "owner");
  async function UpdateSplit() {
    if (await totalamount() !== 1)
      return;
    const result = await Nui.send("UpdatePayments", { owner, employees });
    const data = await result.json();
    if (data) {
      set_store_value(workers, $workers = data, $workers);
    }
  }
  function input_input_handler() {
    owner.payment_shares = to_number(this.value);
    $$invalidate(0, owner);
  }
  function input_input_handler_1(each_value, employee_index) {
    each_value[employee_index].payment_shares = to_number(this.value);
    $$invalidate(1, employees);
  }
  $$self.$$.update = () => {
    if ($$self.$$.dirty & 3) {
      $$invalidate(2, totalamount = () => {
        let total = owner.payment_shares;
        if (employees.length !== 0) {
          total += employees.reduce(
            (accumulator, e) => {
              return accumulator + e.payment_shares;
            },
            0
          );
        }
        const final = Number((typeof total === "number" ? total : 0).toFixed(2));
        return final;
      });
    }
  };
  return [
    owner,
    employees,
    totalamount,
    $Locale,
    UpdateSplit,
    input_input_handler,
    input_input_handler_1
  ];
}
class Payments extends SvelteComponent {
  constructor(options) {
    super();
    init(this, options, instance$4, create_fragment$4, safe_not_equal, {});
  }
}
function get_each_context(ctx, list, i) {
  const child_ctx = ctx.slice();
  child_ctx[11] = list[i];
  return child_ctx;
}
function get_each_context_1(ctx, list, i) {
  const child_ctx = ctx.slice();
  child_ctx[14] = list[i];
  return child_ctx;
}
function create_else_block_1(ctx) {
  let p;
  let t_value = ctx[2]["NoEmployeesFound"] + "";
  let t;
  return {
    c() {
      p = element("p");
      t = text(t_value);
      attr(p, "class", "text-xl");
    },
    m(target, anchor) {
      insert(target, p, anchor);
      append(p, t);
    },
    p(ctx2, dirty) {
      if (dirty & 4 && t_value !== (t_value = ctx2[2]["NoEmployeesFound"] + ""))
        set_data(t, t_value);
    },
    d(detaching) {
      if (detaching)
        detach(p);
    }
  };
}
function create_if_block_1$3(ctx) {
  let each_1_anchor;
  let each_value_1 = ctx[1];
  let each_blocks = [];
  for (let i = 0; i < each_value_1.length; i += 1) {
    each_blocks[i] = create_each_block_1(get_each_context_1(ctx, each_value_1, i));
  }
  return {
    c() {
      for (let i = 0; i < each_blocks.length; i += 1) {
        each_blocks[i].c();
      }
      each_1_anchor = empty();
    },
    m(target, anchor) {
      for (let i = 0; i < each_blocks.length; i += 1) {
        each_blocks[i].m(target, anchor);
      }
      insert(target, each_1_anchor, anchor);
    },
    p(ctx2, dirty) {
      if (dirty & 30) {
        each_value_1 = ctx2[1];
        let i;
        for (i = 0; i < each_value_1.length; i += 1) {
          const child_ctx = get_each_context_1(ctx2, each_value_1, i);
          if (each_blocks[i]) {
            each_blocks[i].p(child_ctx, dirty);
          } else {
            each_blocks[i] = create_each_block_1(child_ctx);
            each_blocks[i].c();
            each_blocks[i].m(each_1_anchor.parentNode, each_1_anchor);
          }
        }
        for (; i < each_blocks.length; i += 1) {
          each_blocks[i].d(1);
        }
        each_blocks.length = each_value_1.length;
      }
    },
    d(detaching) {
      destroy_each(each_blocks, detaching);
      if (detaching)
        detach(each_1_anchor);
    }
  };
}
function create_each_block_1(ctx) {
  let div1;
  let p;
  let t0_value = ctx[14].name + "";
  let t0;
  let t1;
  let div0;
  let button0;
  let t2_value = ctx[2]["Accept"] + "";
  let t2;
  let t3;
  let button1;
  let t4_value = ctx[2]["Delete"] + "";
  let t4;
  let t5;
  let mounted;
  let dispose;
  function click_handler() {
    return ctx[6](ctx[14]);
  }
  function click_handler_1() {
    return ctx[7](ctx[14]);
  }
  return {
    c() {
      div1 = element("div");
      p = element("p");
      t0 = text(t0_value);
      t1 = space();
      div0 = element("div");
      button0 = element("button");
      t2 = text(t2_value);
      t3 = space();
      button1 = element("button");
      t4 = text(t4_value);
      t5 = space();
      attr(p, "class", "text-xl");
      attr(button0, "class", "btn btn-success");
      attr(button1, "class", "btn btn-error");
      attr(div0, "class", "flex gap-2");
      attr(div1, "class", "grid grid-cols-2 place-items-center text-start bg-base-300 p-2 rounded-box");
    },
    m(target, anchor) {
      insert(target, div1, anchor);
      append(div1, p);
      append(p, t0);
      append(div1, t1);
      append(div1, div0);
      append(div0, button0);
      append(button0, t2);
      append(div0, t3);
      append(div0, button1);
      append(button1, t4);
      append(div1, t5);
      if (!mounted) {
        dispose = [
          listen(button0, "click", click_handler),
          listen(button1, "click", click_handler_1)
        ];
        mounted = true;
      }
    },
    p(new_ctx, dirty) {
      ctx = new_ctx;
      if (dirty & 2 && t0_value !== (t0_value = ctx[14].name + ""))
        set_data(t0, t0_value);
      if (dirty & 4 && t2_value !== (t2_value = ctx[2]["Accept"] + ""))
        set_data(t2, t2_value);
      if (dirty & 4 && t4_value !== (t4_value = ctx[2]["Delete"] + ""))
        set_data(t4, t4_value);
    },
    d(detaching) {
      if (detaching)
        detach(div1);
      mounted = false;
      run_all(dispose);
    }
  };
}
function create_else_block(ctx) {
  let p;
  let t_value = ctx[2]["NoEmployeesFound"] + "";
  let t;
  return {
    c() {
      p = element("p");
      t = text(t_value);
      attr(p, "class", "text-xl");
    },
    m(target, anchor) {
      insert(target, p, anchor);
      append(p, t);
    },
    p(ctx2, dirty) {
      if (dirty & 4 && t_value !== (t_value = ctx2[2]["NoEmployeesFound"] + ""))
        set_data(t, t_value);
    },
    d(detaching) {
      if (detaching)
        detach(p);
    }
  };
}
function create_if_block$3(ctx) {
  let each_1_anchor;
  let each_value = ctx[0];
  let each_blocks = [];
  for (let i = 0; i < each_value.length; i += 1) {
    each_blocks[i] = create_each_block(get_each_context(ctx, each_value, i));
  }
  return {
    c() {
      for (let i = 0; i < each_blocks.length; i += 1) {
        each_blocks[i].c();
      }
      each_1_anchor = empty();
    },
    m(target, anchor) {
      for (let i = 0; i < each_blocks.length; i += 1) {
        each_blocks[i].m(target, anchor);
      }
      insert(target, each_1_anchor, anchor);
    },
    p(ctx2, dirty) {
      if (dirty & 37) {
        each_value = ctx2[0];
        let i;
        for (i = 0; i < each_value.length; i += 1) {
          const child_ctx = get_each_context(ctx2, each_value, i);
          if (each_blocks[i]) {
            each_blocks[i].p(child_ctx, dirty);
          } else {
            each_blocks[i] = create_each_block(child_ctx);
            each_blocks[i].c();
            each_blocks[i].m(each_1_anchor.parentNode, each_1_anchor);
          }
        }
        for (; i < each_blocks.length; i += 1) {
          each_blocks[i].d(1);
        }
        each_blocks.length = each_value.length;
      }
    },
    d(detaching) {
      destroy_each(each_blocks, detaching);
      if (detaching)
        detach(each_1_anchor);
    }
  };
}
function create_each_block(ctx) {
  let div;
  let p;
  let t0_value = ctx[11].name + "";
  let t0;
  let t1;
  let button;
  let t2_value = ctx[2]["Remove"] + "";
  let t2;
  let t3;
  let mounted;
  let dispose;
  function click_handler_2() {
    return ctx[8](ctx[11]);
  }
  return {
    c() {
      div = element("div");
      p = element("p");
      t0 = text(t0_value);
      t1 = space();
      button = element("button");
      t2 = text(t2_value);
      t3 = space();
      attr(p, "class", "text-xl");
      attr(button, "class", "btn btn-error");
      attr(div, "class", "grid grid-cols-2 place-items-center text-start bg-base-300 p-2 rounded-box");
    },
    m(target, anchor) {
      insert(target, div, anchor);
      append(div, p);
      append(p, t0);
      append(div, t1);
      append(div, button);
      append(button, t2);
      append(div, t3);
      if (!mounted) {
        dispose = listen(button, "click", click_handler_2);
        mounted = true;
      }
    },
    p(new_ctx, dirty) {
      ctx = new_ctx;
      if (dirty & 1 && t0_value !== (t0_value = ctx[11].name + ""))
        set_data(t0, t0_value);
      if (dirty & 4 && t2_value !== (t2_value = ctx[2]["Remove"] + ""))
        set_data(t2, t2_value);
    },
    d(detaching) {
      if (detaching)
        detach(div);
      mounted = false;
      dispose();
    }
  };
}
function create_fragment$3(ctx) {
  let main;
  let div0;
  let h1;
  let t0_value = ctx[2]["Warehouse"] + "";
  let t0;
  let t1;
  let i0;
  let t2;
  let p0;
  let t3_value = ctx[2]["Menu"] + "";
  let t3;
  let t4;
  let div1;
  let p1;
  let t5_value = ctx[2]["AddNewEmployees"] + "";
  let t5;
  let t6;
  let label0;
  let t7_value = ctx[2]["ShowJobApplications"] + "";
  let t7;
  let t8;
  let p2;
  let t9_value = ctx[2]["RemoveEmployees"] + "";
  let t9;
  let t10;
  let label1;
  let t11_value = ctx[2]["ShowEmployees"] + "";
  let t11;
  let t12;
  let div2;
  let a;
  let i1;
  let t13;
  let p3;
  let t14_value = ctx[2]["GoBack"] + "";
  let t14;
  let t15;
  let input0;
  let t16;
  let div5;
  let div4;
  let label2;
  let t18;
  let h30;
  let t19_value = ctx[2]["AllEmployees"] + "";
  let t19;
  let t20;
  let div3;
  let t21;
  let input1;
  let t22;
  let div8;
  let div7;
  let label3;
  let t24;
  let h31;
  let t25_value = ctx[2]["AllEmployees"] + "";
  let t25;
  let t26;
  let div6;
  function select_block_type(ctx2, dirty) {
    if (ctx2[1].length > 0)
      return create_if_block_1$3;
    return create_else_block_1;
  }
  let current_block_type = select_block_type(ctx);
  let if_block0 = current_block_type(ctx);
  function select_block_type_1(ctx2, dirty) {
    if (ctx2[0].length > 0)
      return create_if_block$3;
    return create_else_block;
  }
  let current_block_type_1 = select_block_type_1(ctx);
  let if_block1 = current_block_type_1(ctx);
  return {
    c() {
      main = element("main");
      div0 = element("div");
      h1 = element("h1");
      t0 = text(t0_value);
      t1 = space();
      i0 = element("i");
      t2 = space();
      p0 = element("p");
      t3 = text(t3_value);
      t4 = space();
      div1 = element("div");
      p1 = element("p");
      t5 = text(t5_value);
      t6 = space();
      label0 = element("label");
      t7 = text(t7_value);
      t8 = space();
      p2 = element("p");
      t9 = text(t9_value);
      t10 = space();
      label1 = element("label");
      t11 = text(t11_value);
      t12 = space();
      div2 = element("div");
      a = element("a");
      i1 = element("i");
      t13 = space();
      p3 = element("p");
      t14 = text(t14_value);
      t15 = space();
      input0 = element("input");
      t16 = space();
      div5 = element("div");
      div4 = element("div");
      label2 = element("label");
      label2.textContent = "\u2715";
      t18 = space();
      h30 = element("h3");
      t19 = text(t19_value);
      t20 = space();
      div3 = element("div");
      if_block0.c();
      t21 = space();
      input1 = element("input");
      t22 = space();
      div8 = element("div");
      div7 = element("div");
      label3 = element("label");
      label3.textContent = "\u2715";
      t24 = space();
      h31 = element("h3");
      t25 = text(t25_value);
      t26 = space();
      div6 = element("div");
      if_block1.c();
      attr(i0, "class", "fa-solid fa-warehouse text-2xl");
      attr(h1, "class", "font-bold text-3xl text-primary");
      attr(p0, "class", "font-bold text-2xl base-content");
      attr(div0, "class", "w-full flex flex-col p-5 bg-base-300 text-center");
      attr(p1, "class", "text-xl text-base-content");
      attr(label0, "for", "ShowJobApplications");
      attr(label0, "class", "btn btn-primary modal-button flex-grow font-bold");
      attr(p2, "class", "text-xl text-base-content");
      attr(label1, "for", "ShowEmployees");
      attr(label1, "class", "btn btn-info modal-button flex-grow font-bold");
      attr(div1, "class", "flex items-center flex-col gap-2 w-full h-full p-5");
      attr(i1, "class", "fas fa-angle-double-left");
      attr(a, "href", "#/exit");
      attr(a, "class", "btn btn-primary flex-grow flex gap-2 flex-row");
      attr(div2, "class", "w-full flex flex-col p-5 bg-base-300 text-center");
      attr(main, "class", "h-fit flex flex-col items-center justify-start");
      attr(input0, "type", "checkbox");
      attr(input0, "id", "ShowJobApplications");
      attr(input0, "class", "modal-toggle");
      attr(label2, "for", "ShowJobApplications");
      attr(label2, "class", "btn btn-sm btn-circle absolute right-2 top-2");
      attr(h30, "class", "text-3xl font-bold text-info text-center");
      attr(div3, "class", "modal-action flex-col gap-2 items-center justify-center bg-base-200 rounded-box p-2");
      attr(div4, "class", "modal-box text-center");
      attr(div5, "class", "modal");
      attr(input1, "type", "checkbox");
      attr(input1, "id", "ShowEmployees");
      attr(input1, "class", "modal-toggle");
      attr(label3, "for", "ShowEmployees");
      attr(label3, "class", "btn btn-sm btn-circle absolute right-2 top-2");
      attr(h31, "class", "text-3xl font-bold text-info text-center");
      attr(div6, "class", "modal-action flex-col gap-2 items-center justify-center bg-base-200 rounded-box p-2");
      attr(div7, "class", "modal-box text-center");
      attr(div8, "class", "modal");
    },
    m(target, anchor) {
      insert(target, main, anchor);
      append(main, div0);
      append(div0, h1);
      append(h1, t0);
      append(h1, t1);
      append(h1, i0);
      append(div0, t2);
      append(div0, p0);
      append(p0, t3);
      append(main, t4);
      append(main, div1);
      append(div1, p1);
      append(p1, t5);
      append(div1, t6);
      append(div1, label0);
      append(label0, t7);
      append(div1, t8);
      append(div1, p2);
      append(p2, t9);
      append(div1, t10);
      append(div1, label1);
      append(label1, t11);
      append(main, t12);
      append(main, div2);
      append(div2, a);
      append(a, i1);
      append(a, t13);
      append(a, p3);
      append(p3, t14);
      insert(target, t15, anchor);
      insert(target, input0, anchor);
      insert(target, t16, anchor);
      insert(target, div5, anchor);
      append(div5, div4);
      append(div4, label2);
      append(div4, t18);
      append(div4, h30);
      append(h30, t19);
      append(div4, t20);
      append(div4, div3);
      if_block0.m(div3, null);
      insert(target, t21, anchor);
      insert(target, input1, anchor);
      insert(target, t22, anchor);
      insert(target, div8, anchor);
      append(div8, div7);
      append(div7, label3);
      append(div7, t24);
      append(div7, h31);
      append(h31, t25);
      append(div7, t26);
      append(div7, div6);
      if_block1.m(div6, null);
    },
    p(ctx2, [dirty]) {
      if (dirty & 4 && t0_value !== (t0_value = ctx2[2]["Warehouse"] + ""))
        set_data(t0, t0_value);
      if (dirty & 4 && t3_value !== (t3_value = ctx2[2]["Menu"] + ""))
        set_data(t3, t3_value);
      if (dirty & 4 && t5_value !== (t5_value = ctx2[2]["AddNewEmployees"] + ""))
        set_data(t5, t5_value);
      if (dirty & 4 && t7_value !== (t7_value = ctx2[2]["ShowJobApplications"] + ""))
        set_data(t7, t7_value);
      if (dirty & 4 && t9_value !== (t9_value = ctx2[2]["RemoveEmployees"] + ""))
        set_data(t9, t9_value);
      if (dirty & 4 && t11_value !== (t11_value = ctx2[2]["ShowEmployees"] + ""))
        set_data(t11, t11_value);
      if (dirty & 4 && t14_value !== (t14_value = ctx2[2]["GoBack"] + ""))
        set_data(t14, t14_value);
      if (dirty & 4 && t19_value !== (t19_value = ctx2[2]["AllEmployees"] + ""))
        set_data(t19, t19_value);
      if (current_block_type === (current_block_type = select_block_type(ctx2)) && if_block0) {
        if_block0.p(ctx2, dirty);
      } else {
        if_block0.d(1);
        if_block0 = current_block_type(ctx2);
        if (if_block0) {
          if_block0.c();
          if_block0.m(div3, null);
        }
      }
      if (dirty & 4 && t25_value !== (t25_value = ctx2[2]["AllEmployees"] + ""))
        set_data(t25, t25_value);
      if (current_block_type_1 === (current_block_type_1 = select_block_type_1(ctx2)) && if_block1) {
        if_block1.p(ctx2, dirty);
      } else {
        if_block1.d(1);
        if_block1 = current_block_type_1(ctx2);
        if (if_block1) {
          if_block1.c();
          if_block1.m(div6, null);
        }
      }
    },
    i: noop,
    o: noop,
    d(detaching) {
      if (detaching)
        detach(main);
      if (detaching)
        detach(t15);
      if (detaching)
        detach(input0);
      if (detaching)
        detach(t16);
      if (detaching)
        detach(div5);
      if_block0.d();
      if (detaching)
        detach(t21);
      if (detaching)
        detach(input1);
      if (detaching)
        detach(t22);
      if (detaching)
        detach(div8);
      if_block1.d();
    }
  };
}
function instance$3($$self, $$props, $$invalidate) {
  let $Locale;
  component_subscribe($$self, Locale, ($$value) => $$invalidate(2, $Locale = $$value));
  let [employees, jobapplications, guests] = [[], [], []];
  async function GetWorkersAndGuests() {
    const result = await Nui.send("GetWorkersAndGuests");
    const data = await result.json();
    $$invalidate(0, employees = data.workers);
    $$invalidate(1, jobapplications = data.jobapplications);
    guests = data.guests;
  }
  GetWorkersAndGuests();
  async function AcceptJobApplication(identifier) {
    Nui.send("AcceptJobApplication", identifier);
    let player = jobapplications.find((e) => e.identifier === identifier);
    $$invalidate(1, jobapplications = jobapplications.filter((e) => e.identifier !== identifier));
    $$invalidate(0, employees = [...employees, { ...player, rank: "employee" }]);
  }
  function DeleteApplication(identifier) {
    Nui.send("DeleteApplication", identifier);
    $$invalidate(1, jobapplications = jobapplications.filter((e) => e.identifier !== identifier));
  }
  function RemoveEmployee(identifier) {
    Nui.send("RemoveEmployee", identifier);
    $$invalidate(0, employees = employees.filter((e) => e.identifier !== identifier));
  }
  const click_handler = (player) => AcceptJobApplication(player.identifier);
  const click_handler_1 = (player) => DeleteApplication(player.identifier);
  const click_handler_2 = (employee) => RemoveEmployee(employee.identifier);
  return [
    employees,
    jobapplications,
    $Locale,
    AcceptJobApplication,
    DeleteApplication,
    RemoveEmployee,
    click_handler,
    click_handler_1,
    click_handler_2
  ];
}
class Employees extends SvelteComponent {
  constructor(options) {
    super();
    init(this, options, instance$3, create_fragment$3, safe_not_equal, {});
  }
}
const Entrance_svelte_svelte_type_style_lang = "";
function create_if_block_2$2(ctx) {
  let div;
  let h1;
  let t_value = ctx[2]["PressYourFinger"] + "";
  let t;
  let div_intro;
  return {
    c() {
      div = element("div");
      h1 = element("h1");
      t = text(t_value);
      attr(h1, "class", "mt-2 text-3xl font-bold svelte-gt9we3");
      attr(div, "class", "w-full p-5 mt-5 svelte-gt9we3");
    },
    m(target, anchor) {
      insert(target, div, anchor);
      append(div, h1);
      append(h1, t);
    },
    p(ctx2, dirty) {
      if (dirty & 4 && t_value !== (t_value = ctx2[2]["PressYourFinger"] + ""))
        set_data(t, t_value);
    },
    i(local) {
      if (!div_intro) {
        add_render_callback(() => {
          div_intro = create_in_transition(div, fade, {});
          div_intro.start();
        });
      }
    },
    o: noop,
    d(detaching) {
      if (detaching)
        detach(div);
    }
  };
}
function create_if_block_1$2(ctx) {
  let div;
  let h1;
  let t0_value = ctx[2]["ScanComplete"] + "";
  let t0;
  let t1;
  let p;
  let t2_value = ctx[2]["YouDontOwnThisWarehouse"] + "";
  let t2;
  let t3;
  let button;
  let t4_value = ctx[2]["ApplyForJob"] + "";
  let t4;
  let div_intro;
  let mounted;
  let dispose;
  return {
    c() {
      div = element("div");
      h1 = element("h1");
      t0 = text(t0_value);
      t1 = space();
      p = element("p");
      t2 = text(t2_value);
      t3 = space();
      button = element("button");
      t4 = text(t4_value);
      attr(h1, "class", "mt-2 text-3xl font-bold text-primary svelte-gt9we3");
      attr(p, "class", "text-3xl font-bold text-error mt-5 svelte-gt9we3");
      attr(button, "class", "btn btn-primary mt-5 svelte-gt9we3");
      attr(div, "class", "w-full p-5 mt-5 svelte-gt9we3");
    },
    m(target, anchor) {
      insert(target, div, anchor);
      append(div, h1);
      append(h1, t0);
      append(div, t1);
      append(div, p);
      append(p, t2);
      append(div, t3);
      append(div, button);
      append(button, t4);
      if (!mounted) {
        dispose = listen(button, "click", ctx[7]);
        mounted = true;
      }
    },
    p(ctx2, dirty) {
      if (dirty & 4 && t0_value !== (t0_value = ctx2[2]["ScanComplete"] + ""))
        set_data(t0, t0_value);
      if (dirty & 4 && t2_value !== (t2_value = ctx2[2]["YouDontOwnThisWarehouse"] + ""))
        set_data(t2, t2_value);
      if (dirty & 4 && t4_value !== (t4_value = ctx2[2]["ApplyForJob"] + ""))
        set_data(t4, t4_value);
    },
    i(local) {
      if (!div_intro) {
        add_render_callback(() => {
          div_intro = create_in_transition(div, fade, {});
          div_intro.start();
        });
      }
    },
    o: noop,
    d(detaching) {
      if (detaching)
        detach(div);
      mounted = false;
      dispose();
    }
  };
}
function create_if_block$2(ctx) {
  let div;
  let h1;
  let t0_value = ctx[2]["ScanComplete"] + "";
  let t0;
  let t1;
  let button;
  let t2_value = ctx[2]["Proceed"] + "";
  let t2;
  let div_intro;
  let mounted;
  let dispose;
  return {
    c() {
      div = element("div");
      h1 = element("h1");
      t0 = text(t0_value);
      t1 = space();
      button = element("button");
      t2 = text(t2_value);
      attr(h1, "class", "mt-2 text-3xl font-bold text-primary svelte-gt9we3");
      attr(button, "class", "btn btn-primary font-bold mt-5 w-full svelte-gt9we3");
      attr(div, "class", "w-full p-5 mt-5 svelte-gt9we3");
    },
    m(target, anchor) {
      insert(target, div, anchor);
      append(div, h1);
      append(h1, t0);
      append(div, t1);
      append(div, button);
      append(button, t2);
      if (!mounted) {
        dispose = listen(button, "click", ctx[9]);
        mounted = true;
      }
    },
    p(ctx2, dirty) {
      if (dirty & 4 && t0_value !== (t0_value = ctx2[2]["ScanComplete"] + ""))
        set_data(t0, t0_value);
      if (dirty & 4 && t2_value !== (t2_value = ctx2[2]["Proceed"] + ""))
        set_data(t2, t2_value);
    },
    i(local) {
      if (!div_intro) {
        add_render_callback(() => {
          div_intro = create_in_transition(div, fade, {});
          div_intro.start();
        });
      }
    },
    o: noop,
    d(detaching) {
      if (detaching)
        detach(div);
      mounted = false;
      dispose();
    }
  };
}
function create_fragment$2(ctx) {
  let div2;
  let div0;
  let h1;
  let t0_value = ctx[2]["EnterWarehouse"] + "";
  let t0;
  let t1;
  let p;
  let t2_value = ctx[2]["VerifyYourIdentity"] + "";
  let t2;
  let t3;
  let div1;
  let scanner;
  let img0;
  let img0_src_value;
  let t4;
  let img1;
  let img1_src_value;
  let t5;
  let t6;
  let div2_transition;
  let current;
  let mounted;
  let dispose;
  let if_block0 = !ctx[0] && create_if_block_2$2(ctx);
  function select_block_type(ctx2, dirty) {
    if (ctx2[0] && (ctx2[3] === "owner" || ctx2[3] === "employee" || ctx2[3] === "guest"))
      return create_if_block$2;
    if (ctx2[0])
      return create_if_block_1$2;
  }
  let current_block_type = select_block_type(ctx);
  let if_block1 = current_block_type && current_block_type(ctx);
  return {
    c() {
      div2 = element("div");
      div0 = element("div");
      h1 = element("h1");
      t0 = text(t0_value);
      t1 = space();
      p = element("p");
      t2 = text(t2_value);
      t3 = space();
      div1 = element("div");
      scanner = element("scanner");
      img0 = element("img");
      t4 = space();
      img1 = element("img");
      t5 = space();
      if (if_block0)
        if_block0.c();
      t6 = space();
      if (if_block1)
        if_block1.c();
      attr(h1, "class", "font-bold text-3xl text-primary svelte-gt9we3");
      attr(p, "class", "font-bold text-2xl base-content svelte-gt9we3");
      attr(div0, "class", "w-full flex flex-col p-5 bg-base-300 text-center svelte-gt9we3");
      attr(img0, "draggable", "false");
      if (!src_url_equal(img0.src, img0_src_value = "./fingerprint/fingerprint.png"))
        attr(img0, "src", img0_src_value);
      attr(img0, "alt", "scanned");
      attr(img0, "class", "object-contain w-full h-full absolute top-1/2 left-1/2 -translate-x-1/2 -translate-y-1/2 svelte-gt9we3");
      toggle_class(img0, "opacity-0", ctx[0]);
      attr(img1, "draggable", "false");
      if (!src_url_equal(img1.src, img1_src_value = "./fingerprint/fingerprint-scanned.png"))
        attr(img1, "src", img1_src_value);
      attr(img1, "alt", "scan");
      attr(img1, "class", "object-contain w-full h-full absolute top-1/2 left-1/2 -translate-x-1/2 -translate-y-1/2 svelte-gt9we3");
      set_style(img1, "opacity", "0");
      attr(scanner, "class", "relative w-full h-56 aspect-square svelte-gt9we3");
      attr(div1, "class", "w-full h-full flex flex-col items-center justify-start mt-10 cursor-pointer svelte-gt9we3");
      attr(div2, "class", "appSize text-center svelte-gt9we3");
    },
    m(target, anchor) {
      insert(target, div2, anchor);
      append(div2, div0);
      append(div0, h1);
      append(h1, t0);
      append(div0, t1);
      append(div0, p);
      append(p, t2);
      append(div2, t3);
      append(div2, div1);
      append(div1, scanner);
      append(scanner, img0);
      append(scanner, t4);
      append(scanner, img1);
      ctx[8](img1);
      append(div1, t5);
      if (if_block0)
        if_block0.m(div1, null);
      append(div1, t6);
      if (if_block1)
        if_block1.m(div1, null);
      current = true;
      if (!mounted) {
        dispose = [
          listen(scanner, "mousedown", ctx[4]),
          listen(scanner, "mouseup", ctx[5]),
          listen(scanner, "mouseleave", ctx[5])
        ];
        mounted = true;
      }
    },
    p(ctx2, [dirty]) {
      if ((!current || dirty & 4) && t0_value !== (t0_value = ctx2[2]["EnterWarehouse"] + ""))
        set_data(t0, t0_value);
      if ((!current || dirty & 4) && t2_value !== (t2_value = ctx2[2]["VerifyYourIdentity"] + ""))
        set_data(t2, t2_value);
      if (!current || dirty & 1) {
        toggle_class(img0, "opacity-0", ctx2[0]);
      }
      if (!ctx2[0]) {
        if (if_block0) {
          if_block0.p(ctx2, dirty);
          if (dirty & 1) {
            transition_in(if_block0, 1);
          }
        } else {
          if_block0 = create_if_block_2$2(ctx2);
          if_block0.c();
          transition_in(if_block0, 1);
          if_block0.m(div1, t6);
        }
      } else if (if_block0) {
        if_block0.d(1);
        if_block0 = null;
      }
      if (current_block_type === (current_block_type = select_block_type(ctx2)) && if_block1) {
        if_block1.p(ctx2, dirty);
      } else {
        if (if_block1)
          if_block1.d(1);
        if_block1 = current_block_type && current_block_type(ctx2);
        if (if_block1) {
          if_block1.c();
          transition_in(if_block1, 1);
          if_block1.m(div1, null);
        }
      }
    },
    i(local) {
      if (current)
        return;
      transition_in(if_block0);
      transition_in(if_block1);
      add_render_callback(() => {
        if (!div2_transition)
          div2_transition = create_bidirectional_transition(div2, fade, {}, true);
        div2_transition.run(1);
      });
      current = true;
    },
    o(local) {
      if (!div2_transition)
        div2_transition = create_bidirectional_transition(div2, fade, {}, false);
      div2_transition.run(0);
      current = false;
    },
    d(detaching) {
      if (detaching)
        detach(div2);
      ctx[8](null);
      if (if_block0)
        if_block0.d();
      if (if_block1) {
        if_block1.d();
      }
      if (detaching && div2_transition)
        div2_transition.end();
      mounted = false;
      run_all(dispose);
    }
  };
}
function instance$2($$self, $$props, $$invalidate) {
  let $menu;
  let $Config;
  let $Locale;
  let $rank;
  component_subscribe($$self, menu, ($$value) => $$invalidate(11, $menu = $$value));
  component_subscribe($$self, Config, ($$value) => $$invalidate(12, $Config = $$value));
  component_subscribe($$self, Locale, ($$value) => $$invalidate(2, $Locale = $$value));
  component_subscribe($$self, rank, ($$value) => $$invalidate(3, $rank = $$value));
  let scanned;
  let scanDuration = $Config.ScanDuration;
  let interval;
  let scannedEl;
  function startCount() {
    let start3 = performance.now();
    interval = setInterval(
      async () => {
        let time_passed = performance.now() - start3;
        if (time_passed >= scanDuration) {
          clearInterval(interval);
          $$invalidate(1, scannedEl.style.opacity = "1", scannedEl);
          $$invalidate(0, scanned = true);
        } else {
          scannedEl ? $$invalidate(1, scannedEl.style.opacity = `${time_passed / 1e3}`, scannedEl) : null;
        }
      },
      1
    );
  }
  function stopCount() {
    clearInterval(interval);
    scannedEl && !scanned ? $$invalidate(1, scannedEl.style.opacity = `0`, scannedEl) : null;
  }
  function enterWarehouse() {
    set_store_value(menu, $menu = void 0, $menu);
    Nui.send("EnterWarehouse");
  }
  function applyForJob() {
    set_store_value(menu, $menu = void 0, $menu);
    Nui.send("applyforjob");
  }
  function img1_binding($$value) {
    binding_callbacks[$$value ? "unshift" : "push"](() => {
      scannedEl = $$value;
      $$invalidate(1, scannedEl);
    });
  }
  const click_handler = () => ($$invalidate(0, scanned = false), enterWarehouse());
  return [
    scanned,
    scannedEl,
    $Locale,
    $rank,
    startCount,
    stopCount,
    enterWarehouse,
    applyForJob,
    img1_binding,
    click_handler
  ];
}
class Entrance extends SvelteComponent {
  constructor(options) {
    super();
    init(this, options, instance$2, create_fragment$2, safe_not_equal, {});
  }
}
function create_if_block_2$1(ctx) {
  let button;
  let t0_value = ctx[0]["LeaveJob"] + "";
  let t0;
  let t1;
  let i;
  let mounted;
  let dispose;
  return {
    c() {
      button = element("button");
      t0 = text(t0_value);
      t1 = text(" \xA0\r\n          ");
      i = element("i");
      attr(i, "class", "fa-solid fa-person-walking-arrow-right");
      attr(button, "class", "btn btn-error flex-grow font-bold");
    },
    m(target, anchor) {
      insert(target, button, anchor);
      append(button, t0);
      append(button, t1);
      append(button, i);
      if (!mounted) {
        dispose = listen(button, "click", ctx[5]);
        mounted = true;
      }
    },
    p(ctx2, dirty) {
      if (dirty & 1 && t0_value !== (t0_value = ctx2[0]["LeaveJob"] + ""))
        set_data(t0, t0_value);
    },
    d(detaching) {
      if (detaching)
        detach(button);
      mounted = false;
      dispose();
    }
  };
}
function create_if_block_1$1(ctx) {
  let a0;
  let div0;
  let t0_value = ctx[0]["Guests"] + "";
  let t0;
  let t1;
  let i0;
  let t2;
  let a1;
  let div1;
  let t3_value = ctx[0]["Employees"] + "";
  let t3;
  let t4;
  let i1;
  let t5;
  let label;
  let t6_value = ctx[0]["ForfeitWarehouse"] + "";
  let t6;
  let t7;
  let i2;
  return {
    c() {
      a0 = element("a");
      div0 = element("div");
      t0 = text(t0_value);
      t1 = text(" \xA0 ");
      i0 = element("i");
      t2 = space();
      a1 = element("a");
      div1 = element("div");
      t3 = text(t3_value);
      t4 = text(" \xA0\r\n            ");
      i1 = element("i");
      t5 = space();
      label = element("label");
      t6 = text(t6_value);
      t7 = text(" \xA0\r\n          ");
      i2 = element("i");
      attr(i0, "class", "fa-solid fa-users");
      attr(a0, "href", "#/guests");
      attr(a0, "class", "btn btn-info flex-grow font-bold");
      attr(i1, "class", "fa-solid fa-building-user");
      attr(a1, "href", "#/employees");
      attr(a1, "class", "btn btn-success flex-grow font-bold");
      attr(i2, "class", "fa-solid fa-circle-question text-lg");
      attr(label, "for", "sellModal");
      attr(label, "class", "btn btn-warning modal-button flex-grow font-bold");
    },
    m(target, anchor) {
      insert(target, a0, anchor);
      append(a0, div0);
      append(div0, t0);
      append(div0, t1);
      append(div0, i0);
      insert(target, t2, anchor);
      insert(target, a1, anchor);
      append(a1, div1);
      append(div1, t3);
      append(div1, t4);
      append(div1, i1);
      insert(target, t5, anchor);
      insert(target, label, anchor);
      append(label, t6);
      append(label, t7);
      append(label, i2);
    },
    p(ctx2, dirty) {
      if (dirty & 1 && t0_value !== (t0_value = ctx2[0]["Guests"] + ""))
        set_data(t0, t0_value);
      if (dirty & 1 && t3_value !== (t3_value = ctx2[0]["Employees"] + ""))
        set_data(t3, t3_value);
      if (dirty & 1 && t6_value !== (t6_value = ctx2[0]["ForfeitWarehouse"] + ""))
        set_data(t6, t6_value);
    },
    d(detaching) {
      if (detaching)
        detach(a0);
      if (detaching)
        detach(t2);
      if (detaching)
        detach(a1);
      if (detaching)
        detach(t5);
      if (detaching)
        detach(label);
    }
  };
}
function create_if_block$1(ctx) {
  let t0_value = ctx[0]["IfyouAcceptYouWillLoseAllMiners"] + "";
  let t0;
  let t1;
  let t2_value = ctx[2].RefundRate * 100 + "";
  let t2;
  let t3;
  let t4_value = ctx[0]["OfTheWarehouseValue"] + "";
  let t4;
  let t5;
  return {
    c() {
      t0 = text(t0_value);
      t1 = space();
      t2 = text(t2_value);
      t3 = text("% ");
      t4 = text(t4_value);
      t5 = text(".");
    },
    m(target, anchor) {
      insert(target, t0, anchor);
      insert(target, t1, anchor);
      insert(target, t2, anchor);
      insert(target, t3, anchor);
      insert(target, t4, anchor);
      insert(target, t5, anchor);
    },
    p(ctx2, dirty) {
      if (dirty & 1 && t0_value !== (t0_value = ctx2[0]["IfyouAcceptYouWillLoseAllMiners"] + ""))
        set_data(t0, t0_value);
      if (dirty & 4 && t2_value !== (t2_value = ctx2[2].RefundRate * 100 + ""))
        set_data(t2, t2_value);
      if (dirty & 1 && t4_value !== (t4_value = ctx2[0]["OfTheWarehouseValue"] + ""))
        set_data(t4, t4_value);
    },
    d(detaching) {
      if (detaching)
        detach(t0);
      if (detaching)
        detach(t1);
      if (detaching)
        detach(t2);
      if (detaching)
        detach(t3);
      if (detaching)
        detach(t4);
      if (detaching)
        detach(t5);
    }
  };
}
function create_fragment$1(ctx) {
  let main;
  let div0;
  let h1;
  let t0_value = ctx[0]["Warehouse"] + "";
  let t0;
  let t1;
  let i0;
  let t2;
  let p0;
  let t3_value = ctx[0]["Menu"] + "";
  let t3;
  let t4;
  let div2;
  let div1;
  let t5;
  let button;
  let t6_value = ctx[0]["ExitWarehouse"] + "";
  let t6;
  let t7;
  let i1;
  let t8;
  let input;
  let t9;
  let div5;
  let div4;
  let label0;
  let t11;
  let h3;
  let t12_value = ctx[0]["Warning"] + "";
  let t12;
  let t13;
  let p1;
  let t14_value = ctx[0]["ThisActionCannotBeReversed"] + "";
  let t14;
  let t15;
  let p2;
  let t16;
  let div3;
  let label1;
  let t17_value = ctx[0]["IAccept"] + "";
  let t17;
  let mounted;
  let dispose;
  function select_block_type(ctx2, dirty) {
    if (ctx2[1] === "owner")
      return create_if_block_1$1;
    if (ctx2[1] === "employee")
      return create_if_block_2$1;
  }
  let current_block_type = select_block_type(ctx);
  let if_block0 = current_block_type && current_block_type(ctx);
  let if_block1 = ctx[2].RefundPlayerForSellingWarehouse && typeof ctx[2].RefundRate === "number" && create_if_block$1(ctx);
  return {
    c() {
      main = element("main");
      div0 = element("div");
      h1 = element("h1");
      t0 = text(t0_value);
      t1 = space();
      i0 = element("i");
      t2 = space();
      p0 = element("p");
      t3 = text(t3_value);
      t4 = space();
      div2 = element("div");
      div1 = element("div");
      if (if_block0)
        if_block0.c();
      t5 = space();
      button = element("button");
      t6 = text(t6_value);
      t7 = text(" \xA0\r\n        ");
      i1 = element("i");
      t8 = space();
      input = element("input");
      t9 = space();
      div5 = element("div");
      div4 = element("div");
      label0 = element("label");
      label0.textContent = "\u2715";
      t11 = space();
      h3 = element("h3");
      t12 = text(t12_value);
      t13 = space();
      p1 = element("p");
      t14 = text(t14_value);
      t15 = space();
      p2 = element("p");
      if (if_block1)
        if_block1.c();
      t16 = space();
      div3 = element("div");
      label1 = element("label");
      t17 = text(t17_value);
      attr(i0, "class", "fa-solid fa-warehouse text-2xl");
      attr(h1, "class", "font-bold text-3xl text-primary");
      attr(p0, "class", "font-bold text-2xl base-content");
      attr(div0, "class", "w-full flex flex-col p-5 bg-base-300 text-center");
      attr(i1, "class", "fa-solid fa-right-from-bracket text-lg");
      attr(button, "class", "btn btn-primary flex-grow font-bold");
      attr(div1, "class", "card flex bg-base-300 p-5 gap-3");
      attr(div2, "class", "flex items-center flex-col gap-10 w-full h-full p-5");
      attr(main, "class", "h-fit flex flex-col items-center justify-start");
      attr(input, "type", "checkbox");
      attr(input, "id", "sellModal");
      attr(input, "class", "modal-toggle");
      attr(label0, "for", "sellModal");
      attr(label0, "class", "btn btn-sm btn-circle absolute right-2 top-2");
      attr(h3, "class", "text-xl font-bold text-warning text-center");
      attr(p1, "class", "font-bold");
      attr(label1, "for", "sellModal");
      attr(label1, "class", "btn btn-success mt-5");
      attr(div3, "class", "modal-action");
      attr(div4, "class", "modal-box text-center");
      attr(div5, "class", "modal");
    },
    m(target, anchor) {
      insert(target, main, anchor);
      append(main, div0);
      append(div0, h1);
      append(h1, t0);
      append(h1, t1);
      append(h1, i0);
      append(div0, t2);
      append(div0, p0);
      append(p0, t3);
      append(main, t4);
      append(main, div2);
      append(div2, div1);
      if (if_block0)
        if_block0.m(div1, null);
      append(div1, t5);
      append(div1, button);
      append(button, t6);
      append(button, t7);
      append(button, i1);
      insert(target, t8, anchor);
      insert(target, input, anchor);
      insert(target, t9, anchor);
      insert(target, div5, anchor);
      append(div5, div4);
      append(div4, label0);
      append(div4, t11);
      append(div4, h3);
      append(h3, t12);
      append(div4, t13);
      append(div4, p1);
      append(p1, t14);
      append(div4, t15);
      append(div4, p2);
      if (if_block1)
        if_block1.m(p2, null);
      append(div4, t16);
      append(div4, div3);
      append(div3, label1);
      append(label1, t17);
      if (!mounted) {
        dispose = [
          listen(button, "click", ctx[3]),
          listen(label1, "click", ctx[4])
        ];
        mounted = true;
      }
    },
    p(ctx2, [dirty]) {
      if (dirty & 1 && t0_value !== (t0_value = ctx2[0]["Warehouse"] + ""))
        set_data(t0, t0_value);
      if (dirty & 1 && t3_value !== (t3_value = ctx2[0]["Menu"] + ""))
        set_data(t3, t3_value);
      if (current_block_type === (current_block_type = select_block_type(ctx2)) && if_block0) {
        if_block0.p(ctx2, dirty);
      } else {
        if (if_block0)
          if_block0.d(1);
        if_block0 = current_block_type && current_block_type(ctx2);
        if (if_block0) {
          if_block0.c();
          if_block0.m(div1, t5);
        }
      }
      if (dirty & 1 && t6_value !== (t6_value = ctx2[0]["ExitWarehouse"] + ""))
        set_data(t6, t6_value);
      if (dirty & 1 && t12_value !== (t12_value = ctx2[0]["Warning"] + ""))
        set_data(t12, t12_value);
      if (dirty & 1 && t14_value !== (t14_value = ctx2[0]["ThisActionCannotBeReversed"] + ""))
        set_data(t14, t14_value);
      if (ctx2[2].RefundPlayerForSellingWarehouse && typeof ctx2[2].RefundRate === "number") {
        if (if_block1) {
          if_block1.p(ctx2, dirty);
        } else {
          if_block1 = create_if_block$1(ctx2);
          if_block1.c();
          if_block1.m(p2, null);
        }
      } else if (if_block1) {
        if_block1.d(1);
        if_block1 = null;
      }
      if (dirty & 1 && t17_value !== (t17_value = ctx2[0]["IAccept"] + ""))
        set_data(t17, t17_value);
    },
    i: noop,
    o: noop,
    d(detaching) {
      if (detaching)
        detach(main);
      if (if_block0) {
        if_block0.d();
      }
      if (detaching)
        detach(t8);
      if (detaching)
        detach(input);
      if (detaching)
        detach(t9);
      if (detaching)
        detach(div5);
      if (if_block1)
        if_block1.d();
      mounted = false;
      run_all(dispose);
    }
  };
}
function instance$1($$self, $$props, $$invalidate) {
  let $menu;
  let $Locale;
  let $rank;
  let $Config;
  component_subscribe($$self, menu, ($$value) => $$invalidate(6, $menu = $$value));
  component_subscribe($$self, Locale, ($$value) => $$invalidate(0, $Locale = $$value));
  component_subscribe($$self, rank, ($$value) => $$invalidate(1, $rank = $$value));
  component_subscribe($$self, Config, ($$value) => $$invalidate(2, $Config = $$value));
  async function exitWarehouse() {
    Nui.send("exitwarehouse");
    set_store_value(menu, $menu = void 0, $menu);
  }
  async function ForfeitWarehouse() {
    Nui.send("ForfeitWarehouse");
    set_store_value(menu, $menu = void 0, $menu);
  }
  async function leaveJob() {
    Nui.send("LeaveJob");
    set_store_value(menu, $menu = void 0, $menu);
  }
  return [$Locale, $rank, $Config, exitWarehouse, ForfeitWarehouse, leaveJob];
}
class Exit extends SvelteComponent {
  constructor(options) {
    super();
    init(this, options, instance$1, create_fragment$1, safe_not_equal, {});
  }
}
const routes = {
  computer: {
    "/": Home,
    "/stats": Stats,
    "/miners": Miners,
    "/order": Order,
    "/power": Power,
    "/payments": Payments
  },
  warehouse: {
    "/": Entrance,
    "/buy": Buy,
    "/exit": Exit,
    "/guests": Guests,
    "/employees": Employees
  }
};
const App_svelte_svelte_type_style_lang = "";
function create_if_block_3(ctx) {
  let main;
  let router;
  let main_transition;
  let current;
  router = new Router({ props: { routes: routes.warehouse } });
  return {
    c() {
      main = element("main");
      create_component(router.$$.fragment);
      attr(main, "class", "bg-base-100 card");
    },
    m(target, anchor) {
      insert(target, main, anchor);
      mount_component(router, main, null);
      current = true;
    },
    p: noop,
    i(local) {
      if (current)
        return;
      transition_in(router.$$.fragment, local);
      add_render_callback(() => {
        if (!main_transition)
          main_transition = create_bidirectional_transition(main, fade, {}, true);
        main_transition.run(1);
      });
      current = true;
    },
    o(local) {
      transition_out(router.$$.fragment, local);
      if (!main_transition)
        main_transition = create_bidirectional_transition(main, fade, {}, false);
      main_transition.run(0);
      current = false;
    },
    d(detaching) {
      if (detaching)
        detach(main);
      destroy_component(router);
      if (detaching && main_transition)
        main_transition.end();
    }
  };
}
function create_if_block(ctx) {
  let main;
  let div0;
  let a0;
  let t1;
  let a1;
  let t3;
  let a2;
  let t5;
  let t6;
  let a3;
  let t8;
  let t9;
  let select;
  let option0;
  let option1;
  let option2;
  let option3;
  let option4;
  let option5;
  let option6;
  let option7;
  let option8;
  let t19;
  let div1;
  let router;
  let main_transition;
  let current;
  let mounted;
  let dispose;
  let if_block0 = ctx[0].Menus.OrdersTab && create_if_block_2();
  let if_block1 = ctx[0].Menus.PaymentsTab && ctx[2] === "owner" && create_if_block_1();
  router = new Router({ props: { routes: routes.computer } });
  return {
    c() {
      main = element("main");
      div0 = element("div");
      a0 = element("a");
      a0.textContent = "Home";
      t1 = space();
      a1 = element("a");
      a1.textContent = "Statistics \u{1F4C8}";
      t3 = space();
      a2 = element("a");
      a2.textContent = "Miners \u{1F527}";
      t5 = space();
      if (if_block0)
        if_block0.c();
      t6 = space();
      a3 = element("a");
      a3.textContent = "Bills \u26A1";
      t8 = space();
      if (if_block1)
        if_block1.c();
      t9 = space();
      select = element("select");
      option0 = element("option");
      option0.textContent = "Theme";
      option1 = element("option");
      option1.textContent = "Light";
      option2 = element("option");
      option2.textContent = "Dark";
      option3 = element("option");
      option3.textContent = "Falcon";
      option4 = element("option");
      option4.textContent = "Euphoria";
      option5 = element("option");
      option5.textContent = "Tron";
      option6 = element("option");
      option6.textContent = "Lofi";
      option7 = element("option");
      option7.textContent = "Winter";
      option8 = element("option");
      option8.textContent = "Dracula";
      t19 = space();
      div1 = element("div");
      create_component(router.$$.fragment);
      attr(a0, "class", "btn flex-grow");
      attr(a0, "href", "#/");
      attr(a1, "class", "btn flex-grow");
      attr(a1, "href", "#/stats");
      attr(a2, "class", "btn flex-grow");
      attr(a2, "href", "#/miners");
      attr(a3, "class", "btn flex-grow");
      attr(a3, "href", "#/power");
      option0.disabled = true;
      option0.selected = true;
      option0.__value = "Theme";
      option0.value = option0.__value;
      option1.__value = "light";
      option1.value = option1.__value;
      option2.__value = "dark";
      option2.value = option2.__value;
      option3.__value = "falcon";
      option3.value = option3.__value;
      option4.__value = "euphoria";
      option4.value = option4.__value;
      option5.__value = "tron";
      option5.value = option5.__value;
      option6.__value = "lofi";
      option6.value = option6.__value;
      option7.__value = "winter";
      option7.value = option7.__value;
      option8.__value = "dracula";
      option8.value = option8.__value;
      attr(select, "data-choose-theme", "");
      attr(select, "class", "select select-bordered max-w-xs");
      attr(select, "id", "themes");
      attr(div0, "class", "flex w-full h-fit gap-2 items-center justify-center p-5 bg-base-300");
      attr(div1, "class", "overflow-y-auto w-full flex-grow");
      attr(main, "class", "computer bg-base-100 card flex flex-col svelte-1cv0wgi");
    },
    m(target, anchor) {
      insert(target, main, anchor);
      append(main, div0);
      append(div0, a0);
      append(div0, t1);
      append(div0, a1);
      append(div0, t3);
      append(div0, a2);
      append(div0, t5);
      if (if_block0)
        if_block0.m(div0, null);
      append(div0, t6);
      append(div0, a3);
      append(div0, t8);
      if (if_block1)
        if_block1.m(div0, null);
      append(div0, t9);
      append(div0, select);
      append(select, option0);
      append(select, option1);
      append(select, option2);
      append(select, option3);
      append(select, option4);
      append(select, option5);
      append(select, option6);
      append(select, option7);
      append(select, option8);
      append(main, t19);
      append(main, div1);
      mount_component(router, div1, null);
      current = true;
      if (!mounted) {
        dispose = [
          action_destroyer(active.call(null, a0, { className: "btn-primary" })),
          action_destroyer(active.call(null, a1, { className: "btn-primary" })),
          action_destroyer(active.call(null, a2, { className: "btn-primary" })),
          action_destroyer(active.call(null, a3, { className: "btn-primary" }))
        ];
        mounted = true;
      }
    },
    p(ctx2, dirty) {
      if (ctx2[0].Menus.OrdersTab) {
        if (if_block0)
          ;
        else {
          if_block0 = create_if_block_2();
          if_block0.c();
          if_block0.m(div0, t6);
        }
      } else if (if_block0) {
        if_block0.d(1);
        if_block0 = null;
      }
      if (ctx2[0].Menus.PaymentsTab && ctx2[2] === "owner") {
        if (if_block1)
          ;
        else {
          if_block1 = create_if_block_1();
          if_block1.c();
          if_block1.m(div0, t9);
        }
      } else if (if_block1) {
        if_block1.d(1);
        if_block1 = null;
      }
    },
    i(local) {
      if (current)
        return;
      transition_in(router.$$.fragment, local);
      add_render_callback(() => {
        if (!main_transition)
          main_transition = create_bidirectional_transition(main, fade, {}, true);
        main_transition.run(1);
      });
      current = true;
    },
    o(local) {
      transition_out(router.$$.fragment, local);
      if (!main_transition)
        main_transition = create_bidirectional_transition(main, fade, {}, false);
      main_transition.run(0);
      current = false;
    },
    d(detaching) {
      if (detaching)
        detach(main);
      if (if_block0)
        if_block0.d();
      if (if_block1)
        if_block1.d();
      destroy_component(router);
      if (detaching && main_transition)
        main_transition.end();
      mounted = false;
      run_all(dispose);
    }
  };
}
function create_if_block_2(ctx) {
  let a;
  let mounted;
  let dispose;
  return {
    c() {
      a = element("a");
      a.textContent = "Order \u{1F4E6}";
      attr(a, "class", "btn flex-grow");
      attr(a, "href", "#/order");
    },
    m(target, anchor) {
      insert(target, a, anchor);
      if (!mounted) {
        dispose = action_destroyer(active.call(null, a, { className: "btn-primary" }));
        mounted = true;
      }
    },
    d(detaching) {
      if (detaching)
        detach(a);
      mounted = false;
      dispose();
    }
  };
}
function create_if_block_1(ctx) {
  let a;
  let mounted;
  let dispose;
  return {
    c() {
      a = element("a");
      a.textContent = "Payments \u{1F4B5}";
      attr(a, "class", "btn flex-grow");
      attr(a, "href", "#/payments");
    },
    m(target, anchor) {
      insert(target, a, anchor);
      if (!mounted) {
        dispose = action_destroyer(active.call(null, a, { className: "btn-primary" }));
        mounted = true;
      }
    },
    d(detaching) {
      if (detaching)
        detach(a);
      mounted = false;
      dispose();
    }
  };
}
function create_default_slot(ctx) {
  let current_block_type_index;
  let if_block;
  let if_block_anchor;
  let current;
  const if_block_creators = [create_if_block, create_if_block_3];
  const if_blocks = [];
  function select_block_type(ctx2, dirty) {
    if (ctx2[1] === "computer")
      return 0;
    if (ctx2[1] === "entrance")
      return 1;
    return -1;
  }
  if (~(current_block_type_index = select_block_type(ctx))) {
    if_block = if_blocks[current_block_type_index] = if_block_creators[current_block_type_index](ctx);
  }
  return {
    c() {
      if (if_block)
        if_block.c();
      if_block_anchor = empty();
    },
    m(target, anchor) {
      if (~current_block_type_index) {
        if_blocks[current_block_type_index].m(target, anchor);
      }
      insert(target, if_block_anchor, anchor);
      current = true;
    },
    p(ctx2, dirty) {
      let previous_block_index = current_block_type_index;
      current_block_type_index = select_block_type(ctx2);
      if (current_block_type_index === previous_block_index) {
        if (~current_block_type_index) {
          if_blocks[current_block_type_index].p(ctx2, dirty);
        }
      } else {
        if (if_block) {
          group_outros();
          transition_out(if_blocks[previous_block_index], 1, 1, () => {
            if_blocks[previous_block_index] = null;
          });
          check_outros();
        }
        if (~current_block_type_index) {
          if_block = if_blocks[current_block_type_index];
          if (!if_block) {
            if_block = if_blocks[current_block_type_index] = if_block_creators[current_block_type_index](ctx2);
            if_block.c();
          } else {
            if_block.p(ctx2, dirty);
          }
          transition_in(if_block, 1);
          if_block.m(if_block_anchor.parentNode, if_block_anchor);
        } else {
          if_block = null;
        }
      }
    },
    i(local) {
      if (current)
        return;
      transition_in(if_block);
      current = true;
    },
    o(local) {
      transition_out(if_block);
      current = false;
    },
    d(detaching) {
      if (~current_block_type_index) {
        if_blocks[current_block_type_index].d(detaching);
      }
      if (detaching)
        detach(if_block_anchor);
    }
  };
}
function create_fragment(ctx) {
  let stopwatch;
  let current;
  stopwatch = new Stopwatch_onlycount({
    props: {
      $$slots: { default: [create_default_slot] },
      $$scope: { ctx }
    }
  });
  return {
    c() {
      create_component(stopwatch.$$.fragment);
    },
    m(target, anchor) {
      mount_component(stopwatch, target, anchor);
      current = true;
    },
    p(ctx2, [dirty]) {
      const stopwatch_changes = {};
      if (dirty & 71) {
        stopwatch_changes.$$scope = { dirty, ctx: ctx2 };
      }
      stopwatch.$set(stopwatch_changes);
    },
    i(local) {
      if (current)
        return;
      transition_in(stopwatch.$$.fragment, local);
      current = true;
    },
    o(local) {
      transition_out(stopwatch.$$.fragment, local);
      current = false;
    },
    d(detaching) {
      destroy_component(stopwatch, detaching);
    }
  };
}
const menu = writable(null);
function instance($$self, $$props, $$invalidate) {
  let $Locale;
  let $Config;
  let $menu, $$unsubscribe_menu = noop;
  let $rank;
  component_subscribe($$self, Locale, ($$value) => $$invalidate(4, $Locale = $$value));
  component_subscribe($$self, Config, ($$value) => $$invalidate(0, $Config = $$value));
  component_subscribe($$self, menu, ($$value) => $$invalidate(1, $menu = $$value));
  component_subscribe($$self, rank, ($$value) => $$invalidate(2, $rank = $$value));
  $$self.$$.on_destroy.push(() => $$unsubscribe_menu());
  async function GetData() {
    try {
      const result = await Nui.send("getConfigAndLocale");
      const data = await result.json();
      set_store_value(Config, $Config = data.config, $Config);
      set_store_value(Locale, $Locale = data.locale, $Locale);
    } catch (e) {
      console.error("Error getting config", e);
    }
  }
  let refreshInterval;
  GetData();
  onMount(() => {
    themeChange.exports.themeChange(false);
    window.addEventListener("keydown", keypressHandler);
    window.addEventListener("message", messageHandler);
    refreshInterval = setInterval(WarehouseData, 5e3);
  });
  onDestroy(() => {
    window.removeEventListener("keypress", keypressHandler, false);
    window.removeEventListener("message", messageHandler, false);
    clearInterval(refreshInterval);
  });
  return [$Config, $menu, $rank];
}
class App extends SvelteComponent {
  constructor(options) {
    super();
    init(this, options, instance, create_fragment, safe_not_equal, {});
  }
}
new App({
  target: document.getElementById("app")
});
