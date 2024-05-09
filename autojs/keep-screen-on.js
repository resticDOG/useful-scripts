/**
 * @author Linkzz
 * @date 2024-03-04
 */

function keepScreenOn() {
  window.screen.orientation.lock('landscape')
}

function exitScreenOn() {
  window.screen.orientation.unlock()
}
