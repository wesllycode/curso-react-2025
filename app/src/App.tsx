import { useState } from "react"

function App() {

    const [count, setCount] = useState(0)

  return (
      <>       
        <p> Meu primeiro projeto em react</p>     
        <button onClick={() => setCount(count + 1)}>
            Count {count} 
        </button>
      </>
  )
}

export default App
