import {useState} from "react";


function App() {
const [count, setCount] = useState(0)

  return (
      <>
          <p>Hello World</p>
          <button onClick={() => setCount(count + 1)}>
              Count {count}
          </button>
      </>
  )
}

export default App
