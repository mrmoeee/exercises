import React from 'react';
import ReactDom from 'react-dom';
import Clock from './clock.jsx';
import Tabs from './tabs.jsx';

function Root() {
  return (
    <div>
      <Clock />
      <div className="interactive">
        <Tabs />
      </div>
    </div>
  );
}

document.addEventListener("DOMContentLoaded", () => {
  ReactDom.render(<Root/>, document.getElementById('root'));
});
