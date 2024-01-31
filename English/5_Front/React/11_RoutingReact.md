[Back](README.md)

## Routing with React Router

<hr>


### 1. What is React Router

>  React Router is a routing library for React apps. A router is responsible for selecting what to show in the app for a requested path.

&nbsp;


### 2. Installing React Router

```shell
npm i react-router-dom
```

&nbsp;

### 3. Declaring routes

#### 3-1) Creating the products list page

a) Creating the data source for the page
Create a folder called data in the src folder and then a file called products.ts within data
<hr>

b) Add the following content into products.ts
```typescript
export type Product = {
  id: number;
  name: string;
  description: string;
  price: number;
};

export const products: Product[] = [
  {
    description: 'A collection of navigational components that compose declaratively with your app',
    id: 1,
    name: 'React Router',
    price: 8,
  },
  {
    description: 'A library that helps manage state across your app',
    id: 2,
    name: 'React Redux',
    price: 12,
  },
  {
    description: 'A library that helps you implement robust forms',
    id: 3,
    name: 'React Hook Form',
    price: 9,
  },
  {
    description: 'A library that helps you interact with a REST API',
    id: 4,
    name: 'React Apollo',
    price: 10,
  },
  {
    description: 'A library that provides utility CSS classes',
    id: 5,
    name: 'Tailwind CSS',
    price: 7,
  },
];
```
<hr>

c) Create the products list page component

Create a file called ProductsPage.tsx in the pages folder for the products list page component
```typescript
import { products } from '../data/products';

export function ProductPage() {
    return (
        <>
            <div className="text-center p-5 text-xl">
                <h2 className="text-base text-slate-600">
                    Here are some great tools for React
                </h2>
                <ul className="list-none m-0 p-0">
                    {products.map((product) => (
                    <li key={product.id} className="p-1 text-base text-slate-800">
                        {product.name}
                    </li>
                    ))}
                </ul>
            </div>
        </>
    );
}
```

&nbsp;

#### 3-2) Understanding React Router’s router

> A router in React Router is a component that tracks the browser’s URL and performs navigation

 createBrowserRouter function creates a browser router

 The following code snippet creates a router with two routes:
 ```typescript
const router = createBrowserRouter([
    {
        path: 'some-page',
        element: <SomePage />,
    },
    {
        path: 'another-page',
        element: <AnotherPage />,
    }
]);
 ```

_When the path is /some-page, the SomePage component will be rendered. When the path is /another-page, the AnotherPage component will be rendered_

The router returned by createBrowserRouter is passed to a RouterProvider component and placed high up in the React component tree, as shown here:
```typescript
const root = ReactDOM.createRoot(
    document.getElementById('root') as HTMLElement
);

root.render(
    <React.StrictMode>
        <RouterProvider router={router} />
    </React.StrictMode>
);
```

&nbsp;

#### 3-3) Declaring the products route

a) Create a file called Routes.tsx in the src folder
```typescript
import { createBrowserRouter, RouterProvider } from 'react-router-dom';
import { ProductsPage } from './pages/ProductsPage';
```


b) Define the router

Add the following component underneath the import statements to define the router with a products route:
```typescript
const router = createBrowserRouter([
    {
        path: 'products',
        element: <ProductsPage />,
    }
]);
```
The ProductsPage component will be rendered when the path is /products

c) Create a component called Routes under the router in Routes.tsx
```typescript
export function Routes() {
    return <RouterProvider router={router} />;
}
```
This component wraps RouterProvider with the router passed into it

d) Add an import statement for the Routes component

e) Render Routes instead of App as the top-level component
```typescript
root.render(
    <React.StrictMode>
        <Routes />
    </React.StrictMode>
);
```

f) Verify the routes

Change the browser URL to http://localhost:3000/products

&nbsp;

### 4. Creating navigation

> React Router comes with components called Link and NavLink, which provide navigation

#### 4-1) Using the Link component

a) Creating a file for the app header called Header.tsx in the src folder

```typescript
import { Link } from 'react-router-dom';
import logo from './logo.svg';
```
<hr>

b) Create the Header component
```typescript
export function Header() {
    return (
        <header className="text-center text-slate-50 bg-slate-900 h-40 p-5">
            <img src={logo} alt="Logo" className="inline-block h-20" />
            <h1 className="text-2xl">React Tools</h1>
            <nav></nav>
        </header>
    );
}
```
_We have used Tailwind classes to make the header gray with the logo and title horizontally centered_

<hr>

c) Create a link inside the nav element
```typescript
<nav>
    <Link to="products" className="text-white no-underline p-1">
        Products
    </Link>
</nav>
```
_The Link component has a to prop that defines the path to navigate to_

<hr>

d) Import the Header component in Routes.tsx
```typescript
import { Header } from './Header';
```
<hr>

e) Add a root path that renders the Header component

```typescript
const router = createBrowserRouter([
    {
        path: '/',
        element: <Header />,
    },
    ...
]);
```



&nbsp;

#### 4-2) Using the NavLink component

> React Router’s NavLink is like a Link element but allows it to be styled differently when active, it is really handy for a navigation bar

a) Open Header.tsx and change the Link references to NavLink

```typescript
import { NavLink } from 'react-router-dom';

export function Header() {
    return (
        <header ...>
            ...
            <nav>
                <NavLink to="products" className="text-white no-underline p-1">
                    Products
                </NavLink>
            </nav>
        </header>
    );
}
```
<hr>

b) Use conditionally style in className prop on the NavLink component

```typescript
<NavLink to="products" className={({ isActive }) =>
        `text-white no-underline p-1 pb-0.5 border-solid border-b-2 
        ${isActive ? 'border-white' : 'border-transparent'}`
    }
>
    Products
</NavLink>
```

NavLink is great for main app navigation when we want to highlight an active link, and Link is great for all the other links in our app

&nbsp;

### 5. Using nested routes

> A nested route allows a segment of a route to render a component

![nested routes demo](https://github.com/Elliot518/mcp-oss-tech/blob/main/frontend/react/routes/nested_routes_demo.png?raw=true)

In the mockup, Profile is the active tab because that is the last segment in the path. If the user selects the History tab, the path would change to /customers/1234/history

This feature is referred to as nested routes because Route components are nested inside each other
```typescript
const router = createBrowserRouter([
    {
        path: 'customer/:id',
        element: <Customer />,
        children: [
            {
                path: 'profile',
                element: <CustomerProfile />,
            },
            {
                path: 'history',
                element: <CustomerHistory />,
            },
            {
                path: 'tasks',
                element: <CustomerTasks />,
            },
        ],
    },
]);
```

#### Using nested routes in the app

1) Open App.tsx and replace all the existing content with the following:

    ```typescript
    import { Outlet } from 'react-router-dom';
    import { Header } from './Header';

    export default function App() {
        return (
            <>
                <Header />
                <Outlet />
            </>
        );
    }
    ```

<hr>

2) Import the App component in Routes.tsx

    Open Routes.tsx, import the App component we just modified, and remove the import component for Header



    ```typescript
    import { createBrowserRouter, RouterProvider } from 'react-router-dom';
    import { ProductsPage } from './pages/ProductsPage';
    import App from './App';
    ````

<hr>

3) Update the router definition as follows

```typescript
const router = createBrowserRouter([
    {
        path: '/',
        element: <App />,
        children: [
            {
                path: 'products',
                element: <ProductsPage />,
            }
        ]
    }
]);
```
The products list page is now nested inside the App component

