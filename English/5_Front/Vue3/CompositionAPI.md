[Back](README.md)

## Composition API

<hr>

### 1. Creating components with the setup() lifecycle method

>Starting from Vue 3.x, the Vue team has introduced the Composition API as a new way to compose Vue components within the setup() lifecycle method.
>
>setup() is the first hook the Vue engine will run in a component’s lifecycle before the beforeCreate() hook.At this point, Vue hasn’t defined a component instance or any component data.

- How
```
This lifecycle method runs once before the initialization and creation of a component and is part of the Options API. The Vue team has dedicated setup() to working with Composition API and any custom hooks (composables) written with the Composition API as an alternative approach to creating reactive components besides the Options API.
```

- syntax
```
setup(props, context) {
	// ...
 	return {
 		//...
 	} 
}
```

&nbsp;

### 2. How it works

The Vue engine will compile the code defined within the <script setup> section into the appropriate code block inside setup()
eg:
```
<script setup>
	const message = 'Hello World'
</script>
```
equal to
```
<script>
export default {
	setup() {
		const message = 'Hello World'
		return {
			message
		}
	} 
}
</script>
```

- defineProps

If you need to use the props parameter, you need to import defineProps() from the vue package and define the props within the <script setup> section
```
<script setup>
import { defineProps } from 'vue'
const { userName } = defineProps({ userName: string }
</script>
```

explanation:
```
userName is now available in the template section as the component’s data props. 
You can also do something similar with defineEmits() for all the custom events of a 
component, useSlots() and useAttrs() for the component’s slots, 
and attrs when using <script setup> instead of the setup() method.
```

&nbsp;

### 3. Watch with composition API

normal code:

```
data() {
   return {
    book:{
      title: 'Vue 3',
      description: 'Vue 3 is awesome',
    }
   }
},
watch: {
 'book.description': (newValue, oldValue) => { 
    console.log(`Book's description changed from ${oldValue} to ${newValue}`)
  }
}
```

composition api:

```
const book = reactive({
 title: 'Vue 3',
 description: 'Vue 3 is awesome',
})
const bookWatcher = watch(
 () => book.description,
 (newValue, oldValue) => console.log(`Book's description changed from ${oldValue} to ${newValue}`)
);
```
