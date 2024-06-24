[Back](README.md)

## React Router

<hr>


> One key feature that React doesn’t provide is routing, which is the ability to handle URLs and navigate between different pages or views in a single-page application.

### 1. Install and configure React Router

install React Router
```shell
npm install react-router-dom @types/react-router-dom
```

If you are using React for the web, you should use **react-router-dom**, and if you are using React Native, you need to use **react-router-native**
&nbsp;

### 2. Create sections

#### Create four stateless components (About, Contact, Home, and Error404) in src/components

- Home.tsx
    ```typescript
    const Home = () => ( 
    <div className="Home">
        <h1>Home</h1>
    </div>
    )
    
    export default Home
    ```

- About.tsx
    ```typescript
    const About = () => ( 
    <div className="About">
        <h1>About</h1>
    </div>
    )
    
    export default About
    ```

- Contact.tsx
    ```typescript
    const Contact = () => ( 
    <div className="Contact">
        <h1>Contact</h1>
    </div>
    )

    export default Contact
    ```

- Error404.tsx
    ```typescript
    const Error404 = () => ( 
    <div className="Error404">
        <h1>Error404</h1>
    </div>
    )

    export default Error404
    ```


&nbsp;

### 3. Create and use routes

#### 3-1) Import route file

After we have created all the functional components, we need to modify our index.tsx(main.tsx) file to  import our route file

```typescript
import { createRoot } from 'react-dom/client'
import { BrowserRouter as Router } from 'react-router-dom'
// Routes
import AppRoutes from './routes'

createRoot(document.getElementById('root') as HTMLElement).render(
  <Router>
    <AppRoutes />
  </Router>
)
```

#### 3-2) Create routes

create a routes.tsx file in src folder
```typescript
import { Routes, Route } from 'react-router-dom'

import App from './App'
import About from './components/About'
import Contact from './components/Contact'
import Home from './components/Home'
import Error404 from './components/Error404'

const AppRoutes = () => (
  <App>
    <Routes>
      <Route path="/" element={<Home />} />
      <Route path="/about" element={<About />} />
      <Route path="/contact" element={<Contact />} />
      <Route path="*" element={<Error404 />} />
    </Routes>
  </App>
)

export default AppRoutes
```

#### 3-3) Import routes in App

modify main.tsx file to import our router components
```typescript
import { createRoot } from 'react-dom/client'
import { BrowserRouter as Router } from 'react-router-dom'

// Routes
import AppRoutes from './routes'

createRoot(document.getElementById('root') as HTMLElement).render(
  <Router>
    <AppRoutes />
  </Router>
)
```

#### 3-4) Render routes

We need to modify our App.tsx file to render the route components as children

```typescript
import { FC } from 'react'
import { Link } from 'react-router-dom'
import './App.css'

const App: FC<any> = ({ children }) => (
  <div className="App">
    <ul className="menu">
      <li>
        <Link to="/">Home</Link>
      </li>
      <li>
        <Link to="/about">About</Link>
      </li>
      <li>
        <Link to="/contacts">Contacts</Link>
      </li>
      <li>
        <Link to="/contact">Contact</Link>
      </li>
    </ul>

    {children}
  </div>
)

export default App
```

&nbsp;

### 4. Adding parameters to the routes

```typescript
if (contactId > 0) {
    // If the contact id is higher than 0 then we filter it from our
    // contacts array.
    selectedContact = contacts.filter((contact) => contact.id === Number(contactId))[0]
  }

  const renderSingleContact = ({ name, email, phone }: Contact) => (
    <>
      <h2>{name}</h2>
      <p>{email}</p>
      <p>{phone}</p>
    </>
  )

  const renderContacts = () => (
    <ul>
      {contacts.map((contact: Contact, key) => (
        <li key={key}>
          <Link to={`/contacts/${contact.id}`}>{contact.name}</Link>
        </li>
      ))}
    </ul>
  )
  ```
  