function create_note_block(title, link, note_id) {
    return `
        <div class="notification">
            <h2 class="note-title">${title}</h2>
            <button class="note-link" note_id="${note_id}" onclick="go_to_note_link(this)" href=${link}><h2>Перейти</h2></button>
        </div>
    `
}

function update_notes_count() {
    const span = document.getElementById('notes-count')
    const user_id = document.getElementById('user_id').value

    let xhr = new XMLHttpRequest()
    xhr.open('GET', `/get_notes_count/${user_id}`)
    xhr.send()
    xhr.responseType = 'json'

    xhr.onload = () => {
        let count = xhr.response['count']
        span.textContent = `(${count})`
    }
}

function show_notes() {
    const modal = document.getElementById('notes-modal')
    const user_id = document.getElementById('user_id').value
    update_notes_count()

    let xhr = new XMLHttpRequest()
    xhr.open('GET', `/get_notes/${user_id}`)
    xhr.send()
    xhr.responseType = 'json'

    xhr.onload = () => {
        console.log(xhr.response)
        modal.innerHTML = ''

        if (xhr.response['notes'].length > 0) {
            xhr.response['notes'].forEach((note) => {
                modal.innerHTML += create_note_block(note['title'], note['link'], note['id'])
            })
        } else {
            modal.innerHTML += create_note_block("У вас нет уведомлений!", "", "")
        }

    }

    if (modal.style['display'] === 'none')
        modal.style['display'] = 'block'
    else
        modal.style['display'] = 'none'
}


function go_to_note_link(el) {
    let xhr = new XMLHttpRequest()
    xhr.open('GET', `/mark_note_as_read/${el.getAttribute("note_id")}`)
    xhr.send()
    window.location.href = el.getAttribute("href")
}
