import {useState} from "react";


function App() {
const [count, setCount] = useState(0)

  return (
      <div className="app-container">
          <p>Hello World</p>
          <div className="button-container">
            <button onClick={() => setCount(count + 1)}>
                Count {count}
            </button>
          </div>
         
      </div>
  )
}

export default App
