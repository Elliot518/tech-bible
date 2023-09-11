[Back](README.md)

## Routing Hooks

<hr>


### 1. beforeEach

>beforeEach is a global Hook and is called at the very beginning of navigation, before the other global and in-component Hooks are triggered.

- index.js
```javascript
const router = createRouter({
 //...
})
//router.beforeEach(beforeEachCallback)
router.beforeEach((
    to, // The destination route
    from, //The source route
    next //The function to trigger to resolve the hook
) => {
    if (to.name === 'about' && (!to.query?.user)) {
        next({ name: 'error' })
    }
    else {
        next();
    }
})
```

&nbsp;

### 2. beforeResolve

> Unlike beforeEach, which is triggered when navigation is set up, beforeResolve will be triggered just before the navigation is carried out and confirmed after all the Hooks (both global and in-component) are resolved.

- index.js
```javascript
router.beforeResolve((
    to, // The destination route
    from, //The source route
    next //The function to trigger to resolve the hook
) => {
    if (to.name === 'about' && (!to.query?.user)) {
        next({ name: 'error' })
    }
    else {
        next();
    }
})
```
&nbsp;

### 3. afterEach

> The afterEach() Hook is the last global navigation guard to be triggered after the navigation is confirmed. Unlike the other global guards, the hook function to pass to afterEach() does not receive a next function, hence, it won’t affect the navigation.


